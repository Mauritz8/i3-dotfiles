#!/bin/sh
i3lock --nofork                 	\
    --ignore-empty-password		\
    \
    --indicator				\
    --bar-indicator			\
    --bar-pos="1070"		\
    --bar-base-width="10"		\
    --bar-orientation=horizontal	\
    --bar-color=2e3440			\
    --ringver-color=88c0d0		\
    --ringwrong-color=bf616a		\
    --bshl-color=5e81ac			\
    --keyhl-color=a3be8c			\
    \
    --clock				\
    --time-color=eceff4ff		\
    --time-str="%H:%M"		\
    --time-font="Iosevka Term"	\
    --time-size=150			\
    --time-pos="1400:875"		\
    --time-color=d3d3d3		\
    \
    --date-color=d8dee9ff		\
    --date-str="%A, %d %B"		\
    --date-color=d3d3d3		\
    --date-font="Iosevka Term"	\
    --date-size=95			\
    --date-pos="tx:1020"	\
    \
    --verif-font="Iosevka Term"	\
    --verif-size=150			\
    --verif-text="Welcome home!"		\
    --wrong-font="Iosevka Term"	\
    --wrong-size=150			\
    --wrong-text="No Entry!"		\
    \
    --image=/home/mauritz/Pictures/fantasy-g73be1ce54_1920.png
