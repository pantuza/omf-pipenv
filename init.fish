# pipenv initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies
#


#
# This code is originally written by https://github.com/kennethreitz.
# This copy only allows users of pipenv project to have completion through
# Oh My Fish.
#


# set the user installation path

if command -s pipenv > /dev/null

    eval (env _PIPENV_COMPLETE=source-fish pipenv)

    function __pipenv_shell_activate --on-variable PWD
        if status --is-command-substitution
            return
        end

        if not test -n "$PIPENV_ACTIVE"
          if sh -c 'pipenv --venv &> /dev/null'
            exec pipenv shell
          end
        end
    end
else
    function pipenv -d "http://docs.pipenv.org/en/latest/"
        echo "Install http://docs.pipenv.org/en/latest/ to use this plugin." > /dev/stderr
        return 1
    end
end
