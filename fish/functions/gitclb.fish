function gitclb --description 'Remove local branches that are not in origin'
    git fetch -p

    set  default N
    set  options "y/N"

    for option in $argv
        switch "$option"
            case "-Y" "--yes"
            set default Y
            set options "Y/n"
        end
    end

    # get - https://github.com/fisherman/get
    for branch in (git branch -vv | awk '{print $1,$4}' | grep 'gone]' | awk '{print $1}')
        get --prompt="Remove $branch [$options]? " --rule=[yYnN] --default="$default" | read confirm
        switch $confirm
          case y Y
            git branch -D $branch
        end
    end

    for branch in (git branch -vv | cut -c 3- | awk '$3 !~/\[/ { print $1 }')
        get --prompt="Remove local branch $branch [$options]? " --rule=[yYnN] --default="$default" | read confirm
        switch $confirm
          case y Y
            git branch -D $branch
        end
    end

end
