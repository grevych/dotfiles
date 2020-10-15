PROJECTS_BASE_DIR='/Users/gerardo.reyes/projects'

activateNodeProject()
{
	activateProject node $1
}

activatePythonProject()
{
	activateProject python $1
}

activateProject()
{
	cd $PROJECTS_BASE_DIR/$2
	source env/$1/bin/activate
	cd repo
	git status
}

_activatePythonProject()
{
	_values -s \ "Python projects" $(ls $HOME/projects)
}

_activateNodeProject()
{
	_values -s \ "Node projects" $(ls $HOME/projects)
}

compdef _activatePythonProject activatePythonProject
compdef _activateNodeProject activateNodeProject

alias anp='activateNodeProject'
alias app='activatePythonProject'
alias gdfs='git diff --staged'
alias gdf='git diff'
