
firedock(){
    running_foxes=$(docker ps -a --filter "status=running" |grep firefox|wc -l)
    all_foxes=$(docker ps -a |grep firefox|wc -l)
    compare="1"

    if [ $all_foxes = "1" ]; then
            echo "firedock: $all_foxes stance(s)"
        if [ $running_foxes = "1" ]; then
            echo "firedock: stance is already running"
        else
            echo "firedock: restarting stopped firedock"
            docker start firedock
        fi
    else
        echo "firedock: starting new firedock"
        docker run -it -e DISPLAY=$DISPLAY --name firedock -v /tmp/.X11-unix/:/tmp/.X11-unix --net=host firefox
    fi
}

firedock

    # if [[ "$running" -eq "1"]]; then
    #     echo "teste"
    # fi

# firedock=$(screen -ls)

# if [[ $firedock == *"firedock"* ]]; then
#     echo $(date +"%Y-%m-%d %H:%M:%S") "firefox docker already enabled"
# else
#     echo $(date +"%Y-%m-%d %H:%M:%S") "enabling firefox docker refreshment"
#     screen -dmS fresh-corner bash -c 'date +"%Y-%m-%d %H:%M:%S enabling firefox docker"; docker run -it --name firedock --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix --net=host firefox; '
# fi



