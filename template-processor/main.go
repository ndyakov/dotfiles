package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

// Config holds all template variables
type Config struct {
	Variables map[string]string `json:"variables"`
}

const (
	configFile     = "template-config.json"
	templateSuffix = ".template"
)

func main() {
	fmt.Println("🔧 Dotfiles Template Processor")
	fmt.Println("================================\n")

	// Get the dotfiles root directory (parent of template-processor)
	dotfilesRoot, err := filepath.Abs("..")
	if err != nil {
		fmt.Printf("Error getting dotfiles root: %v\n", err)
		os.Exit(1)
	}

	// Load or create config
	config, err := loadConfig(filepath.Join(dotfilesRoot, configFile))
	if err != nil {
		fmt.Printf("Error loading config: %v\n", err)
		os.Exit(1)
	}

	// Find all template files
	fmt.Println("🔍 Scanning for template files...")
	templateFiles, err := findTemplateFiles(dotfilesRoot)
	if err != nil {
		fmt.Printf("Error finding templates: %v\n", err)
		os.Exit(1)
	}

	if len(templateFiles) == 0 {
		fmt.Println("No template files found!")
		return
	}

	fmt.Printf("Found %d template file(s)\n\n", len(templateFiles))

	// Extract all variables from templates
	allVars := make(map[string]bool)
	for _, tmplFile := range templateFiles {
		vars, err := extractVariables(tmplFile)
		if err != nil {
			fmt.Printf("Warning: Error extracting variables from %s: %v\n", tmplFile, err)
			continue
		}
		for _, v := range vars {
			allVars[v] = true
		}
	}

	// Check for missing variables and prompt user
	modified := false
	for varName := range allVars {
		if _, exists := config.Variables[varName]; !exists {
			fmt.Printf("📝 Variable '%s' not found in config\n", varName)
			value := promptUser(fmt.Sprintf("Enter value for %s", varName), getDefaultValue(varName))
			config.Variables[varName] = value
			modified = true
		}
	}

	// Save config if modified
	if modified {
		if err := saveConfig(filepath.Join(dotfilesRoot, configFile), config); err != nil {
			fmt.Printf("Error saving config: %v\n", err)
			os.Exit(1)
		}
		fmt.Println("\n✅ Configuration saved!")
	}

	// Display current configuration
	fmt.Println("\n📋 Current Configuration:")
	fmt.Println("========================")
	for key, value := range config.Variables {
		fmt.Printf("  %s = %s\n", key, value)
	}

	// Ask if user wants to process templates
	fmt.Print("\n🚀 Process templates now? (y/n): ")
	if !askYesNo() {
		fmt.Println("Skipping template processing.")
		return
	}

	// Process all templates
	fmt.Println("\n⚙️  Processing templates...")
	for _, tmplFile := range templateFiles {
		outputFile := strings.TrimSuffix(tmplFile, templateSuffix)
		if err := processTemplate(tmplFile, outputFile, config); err != nil {
			fmt.Printf("❌ Error processing %s: %v\n", tmplFile, err)
		} else {
			relPath, _ := filepath.Rel(dotfilesRoot, outputFile)
			fmt.Printf("✅ Generated: %s\n", relPath)
		}
	}

	fmt.Println("\n🎉 Done!")
}

// loadConfig loads the configuration from JSON file
func loadConfig(path string) (*Config, error) {
	config := &Config{
		Variables: make(map[string]string),
	}

	if _, err := os.Stat(path); os.IsNotExist(err) {
		// Config doesn't exist, return empty config
		return config, nil
	}

	data, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}

	if err := json.Unmarshal(data, config); err != nil {
		return nil, err
	}

	return config, nil
}

// saveConfig saves the configuration to JSON file
func saveConfig(path string, config *Config) error {
	data, err := json.MarshalIndent(config, "", "  ")
	if err != nil {
		return err
	}

	return ioutil.WriteFile(path, data, 0644)
}

// findTemplateFiles recursively finds all .template files
func findTemplateFiles(root string) ([]string, error) {
	var templates []string

	err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}

		// Skip .git directories and template-processor directory
		if info.IsDir() && (info.Name() == ".git" || info.Name() == "template-processor") {
			return filepath.SkipDir
		}

		if !info.IsDir() && strings.HasSuffix(info.Name(), templateSuffix) {
			templates = append(templates, path)
		}

		return nil
	})

	return templates, err
}

// extractVariables extracts all {{VARIABLE}} patterns from a template file
func extractVariables(path string) ([]string, error) {
	content, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}

	// Match {{VARIABLE_NAME}} pattern
	re := regexp.MustCompile(`\{\{([A-Z_][A-Z0-9_]*)\}\}`)
	matches := re.FindAllStringSubmatch(string(content), -1)

	vars := make(map[string]bool)
	for _, match := range matches {
		if len(match) > 1 {
			vars[match[1]] = true
		}
	}

	result := make([]string, 0, len(vars))
	for v := range vars {
		result = append(result, v)
	}

	return result, nil
}

// processTemplate processes a template file and writes the output
func processTemplate(templatePath, outputPath string, config *Config) error {
	content, err := ioutil.ReadFile(templatePath)
	if err != nil {
		return err
	}

	result := string(content)

	// Replace all variables
	for varName, varValue := range config.Variables {
		placeholder := fmt.Sprintf("{{%s}}", varName)
		result = strings.ReplaceAll(result, placeholder, varValue)
	}

	return ioutil.WriteFile(outputPath, []byte(result), 0644)
}

// promptUser prompts the user for input with a default value
func promptUser(prompt, defaultValue string) string {
	reader := bufio.NewReader(os.Stdin)

	if defaultValue != "" {
		fmt.Printf("%s [%s]: ", prompt, defaultValue)
	} else {
		fmt.Printf("%s: ", prompt)
	}

	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	if input == "" && defaultValue != "" {
		return defaultValue
	}

	return input
}

// askYesNo asks a yes/no question
func askYesNo() bool {
	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')
	input = strings.ToLower(strings.TrimSpace(input))
	return input == "y" || input == "yes"
}

// getDefaultValue returns a sensible default for common variables
func getDefaultValue(varName string) string {
	switch varName {
	case "HOME_DIR":
		if home, err := os.UserHomeDir(); err == nil {
			return home
		}
		return ""
	case "FONT":
		return "JetBrains Mono"
	case "SIGN_KEY":
		return ""
	default:
		// Check if it's a color variable
		if strings.HasPrefix(varName, "COLOR_") {
			return "#000000"
		}
		return ""
	}
}

