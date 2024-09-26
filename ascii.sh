#!/usr/bin/bash

input=$1
out=""
len=4

charmap=(
        ' #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### '
        '# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # '
        '### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## '
        '# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       '
        '# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  ')

alpha=()

for (( i=0; i<${#input}; i++ ))
do
        char=${input:i:1}
        as_str=$(printf "%d" "'$char")
        as_int=$((as_str-96))
        alpha+=($as_int)
done

for row in "${charmap[@]}":
do
        for index in "${alpha[@]}"
        do

                if ((index < 0))
                then
                        index=27
                fi

                start=$(( (index-1) * len))
                end=$(( (index-1) * len + len ))
                out+="${row:start:len}"
        done

        out+='\n'
done

echo -e "\n$out"
