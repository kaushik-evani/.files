#!/bin/zsh

WORKSPACE_PATH="/home/$USER/HandyTrain"

opencore()
{
    echo "+_+ Setting up $WORKSPACE_CODE..."
    eval "cd $WORKSPACE_PATH/core/handytrain"
    eval "source ../env/bin/activate"
    echo "+_+ DONE"
}

openworkspace()
{
    echo "+_+ Setting up $WORKSPACE_CODE..."
    eval "cd $WORKSPACE_PATH/$1"
    echo "+_+ DONE"
}

WORKSPACE_CODE=$1

case $WORKSPACE_CODE in
    core)
        opencore
        ;;
    web)
        openworkspace "htplatform"
        ;;
    voice)
        openworkspace "voice+_+local"
        ;;
    solomon)
        openworkspace "solomon+_+evanix"
        ;;
    *)
        echo "Invalid Workspace. Are you sure you are working on something called $WORKSPACE_CODE"
esac
