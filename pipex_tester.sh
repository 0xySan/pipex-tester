#!/bin/bash

# -=-=-=-=-	CLRS -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

DEF_COLOR='\033[0;39m'
BLACK='\033[0;30m'
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[0;93m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'
CYAN='\033[0;96m'
GRAY='\033[0;90m'
WHITE='\033[0;97m'

printf ${BLUE}"\n------------------------------------------------------------------------------------------------------------------------\n";
printf ${YELLOW}"\n\t\t\t\t\t   TEST CREATED BY: ";
printf ${CYAN}"\e[4m\e[1mETAQUET / 0xysan\e[0m\t\n";
printf ${BLUE}"\n------------------------------------------------------------------------------------------------------------------------\n";

rm -f traces.txt
rm -f out test_file_nb_3 test_file_nb_6 test_file.txt rpipex fpipex r1pipex r2pipex

# -=-=-=-=-	Control errors -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

USR_PATH="$PWD/usr_path"

if [ -f "$USR_PATH" ]; then
	printf "Found path file.\n"
	usr_path=$(cat $USR_PATH)
	make $usr_path > /dev/null 2>&1
	make $usr_path clean > /dev/null 2>&1
	TEST_PATH=$(ls $usr_path 2>&1)
	TEST_MAKE=$(echo "$TEST_PATH" | grep pipex | wc -l)
	TEST_PATH2=$(echo "$TEST_PATH" | grep "such file or directory" | wc -l)
	TEST_PATH3=$(make -C $usr_path 2>&1)
	TEST_PATH4=$(echo "$TEST_PATH3" | grep "no makefile found" | wc -l)
	exit_code=$?
	if [ "$TEST_PATH2" -gt 0 ] || [ "$TEST_PATH4" -gt 0 ] || [ "$exit_code" -gt 0 ] || [ "$TEST_MAKE" -eq 0 ]; then
	    printf ${MAGENTA}"The path is not correct anymore, did you change the path or did you move the emplacement? If it the case please retype the path.\nIf it is not the case try opening an issue on github I could help : \t\t\t${CYAN}\e[4m\e[1mgithub.com/0xysan/pipex_tester/issues\e[0m.\n${MAGENTA}If you don't have github (I despise you.) you can contact me on discord : \t\t${CYAN}\e[4m\e[1m0xyan.\e[0m\n${MAGENTA}And If you have neither of those (Despises you more :>) you can message me on Slack : \t${CYAN}\e[4m\e[1metaquet.\e[0m\n\t\t\t\t\t\t${RED}Waiting for input : \n\t\t\t\t\t\t\t"${YELLOW}
		read usr_path
		echo $usr_path > $USR_PATH
    fi
	usr_path=$(cat $USR_PATH)
	make $usr_path > /dev/null 2>&1
	make $usr_path clean > /dev/null 2>&1
	TEST_PATH=$(ls $usr_path 2>&1)
	TEST_MAKE=$(echo "$TEST_PATH" | grep pipex | wc -l)
	TEST_PATH2=$(echo "$TEST_PATH" | grep "such file or directory" | wc -l)
	TEST_PATH3=$(make -C $usr_path 2>&1)
	TEST_PATH4=$(echo "$TEST_PATH3" | grep "no makefile found" | wc -l)
	exit_code=$?
	while [ "$TEST_PATH2" -gt 0 ] || [ "$TEST_PATH4" -gt 0 ] || [ "$exit_code" -gt 0 ] || [ "$TEST_MAKE" -eq 0 ]
	do
	    printf ${RED}"\t\t\t\t\tInvalid path. Please try again.\n\t\t\t\t\t\t\t"${YELLOW}
        read usr_path
		make $usr_path > /dev/null 2>&1
		make $usr_path clean > /dev/null 2>&1
		TEST_PATH=$(ls $usr_path 2>&1)
		TEST_MAKE=$(echo "$TEST_PATH" | grep pipex | wc -l)
		TEST_PATH2=$(echo "$TEST_PATH" | grep "such file or directory" | wc -l)
		TEST_PATH3=$(make -C $usr_path 2>&1)
		TEST_PATH4=$(echo "$TEST_PATH3" | grep "no makefile found" | wc -l)
		exit_code=$?
		echo $usr_path > $USR_PATH
	done
	echo $usr_path > $USR_PATH
else
	printf "\nThis is surely the first time you use this tester.\n"
	printf "Just as a Heads up. Please don't use this tester as a easy way to farm points or to try your own function.\n"
	printf "Now can you please enter the path to your pipex folder.\n"${YELLOW}
	read usr_path
	make $usr_path > /dev/null 2>&1
	make $usr_path clean > /dev/null 2>&1
	TEST_PATH=$(ls $usr_path 2>&1)
	TEST_MAKE=$(echo "$TEST_PATH" | grep pipex | wc -l)
	TEST_PATH2=$(echo "$TEST_PATH" | grep "such file or directory" | wc -l)
	TEST_PATH3=$(make -C $usr_path 2>&1)
	TEST_PATH4=$(echo "$TEST_PATH3" | grep "no makefile found" | wc -l)
	exit_code=$?
	while [ "$TEST_PATH2" -gt 0 ] || [ "$TEST_PATH4" -gt 0 ] || [ "$exit_code" -gt 0 ] || [ "$TEST_MAKE" -eq 0 ]
	do
	    printf ${RED}"\t\t\t\t\tInvalid path. Please try again.\n\t\t\t\t\t\t\t"${YELLOW}
        read usr_path
		make $usr_path > /dev/null 2>&1
		make $usr_path clean > /dev/null 2>&1
		TEST_PATH=$(ls $usr_path 2>&1)
		TEST_MAKE=$(echo "$TEST_PATH" | grep pipex | wc -l)
		TEST_PATH2=$(echo "$TEST_PATH" | grep "such file or directory" | wc -l)
		TEST_PATH3=$(make -C $usr_path 2>&1)
		TEST_PATH4=$(echo "$TEST_PATH3" | grep "no makefile found" | wc -l)
		exit_code=$?
		echo $usr_path > $USR_PATH
	done
	echo $usr_path > $USR_PATH
fi

MAKEFILE=$USR_PATH/Makefile
FILE=pipex
FICHERO=test_check.txt
COUNTR=0
COUNTY=0
COUNTG=0
TOT=0
TEST_FILE=test_file.txt
corr_path=$(cat $USR_PATH)

touch $corr_path test_file.txt
echo "This is a test file." > $corr_path/$TEST_FILE
echo "This test file is to test if your pipex is functionnal or not". >> $corr_path/$TEST_FILE
echo "It will be helpful when using the tester." >> $corr_path/$TEST_FILE
echo "If you have finished using the tester you can delete this file." >> $corr_path/$TEST_FILE
echo "Do not rely only on these test, try your own too to see if you really understand the subject." >> $corr_path/$TEST_FILE

if [ -f Makefile ]; then
	corr_path=$(cat $USR_PATH)
	make -C $corr_path > /dev/null 2>&1
	make clean -C $usr_path > /dev/null 2>&1
fi

if [ -f "$corr_path/$FILE" ]; then
	echo -n
else
	printf ${RED}"$corr_path/pipex: No such file or directory\n";
	make fclean > /dev/null 2>&1
	exit 0
fi

printf ${MAGENTA}"\n------------------------------------------------------------------------------------------------------------------------\n";
printf "\n\t\t\t\t\t\t     CONTROL ERRORS\t\n";
printf "\n------------------------------------------------------------------------------------------------------------------------\n";

# -=-=-=-=-    Testing pipex error 1: missing command in the first pipe -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 1: missing command in the first pipe\n";

output=$($corr_path/pipex 2>&1)
exit_code=$?

if [ -n "$output" ] || [ $exit_code -ne 0 ]; then
    printf ${GREEN}"OK. AN ERROR OCCURED\n";
	((COUNTG++))
else
    echo ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR AT ALL WHEN NO ARGUEMENTS IS GIVEN\n\n"
	((COUNTR++))
fi
((TOT++))


# -=-=-=-=-    Testing pipex error 2: enough arguments but input file doesn't exist -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 2: enough arguments but input file doesn't exist\n";

output=$($corr_path/pipex mmmmmmmmmm "ls -l" "grep ." out 2>&1)

line_count=$(echo "$output" | grep mmmmmmmmmm | grep "such file or directory" | wc -l)
line_count2=$(echo "$output" | wc -l)

if [ "$line_count" -eq 1 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count2" -eq 1 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN INPUT FILE DOESN'T EXIST\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 3: enough arguments but input file isn't readable -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 3: enough arguments but input file isn't readable\n";

touch test_file_nb_3
chmod 000 test_file_nb_3

output=$($corr_path/pipex test_file_nb_3 "ls -l" "grep ." out 2>&1)

line_count=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
line_count2=$(echo "$output" | wc -l)

if [ "$line_count" -eq 1 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count2" -eq 1 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN INPUT FILE ISNT'T READABLE\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 4: enough arguments but output file isn't writable -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 4: enough arguments but output file isn't writable\n";

output=$($corr_path/pipex test_file.txt "ls -l" "grep ." test_file_nb_3 2>&1)

line_count=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
line_count2=$(echo "$output" | wc -l)

if [ "$line_count" -eq 1 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count2" -eq 1 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN OUTPUT FILE ISNT'T WRITABLE\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 5: enough arguments but output file isn't writable and input file doesn't exist -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 5: enough arguments but output file isn't writable and input file doesn't exist\n";

output=$($corr_path/pipex mmmmmmmmmm "ls -l" "grep ." test_file_nb_3 2>&1)

line_count=$(echo "$output" | grep mmmmmmmmmm | grep "such file or directory" | wc -l)
line_count2=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
((line_count_tot= line_count + line_count2))
line_count_tot2=$(echo "$output" | wc -l)

if [ "$line_count_tot" -eq 2 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count_tot2" -gt 0 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN OUTPUT FILE ISNT'T WRITABLE AND INPUT FILE DOESN'T EXIST\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 6: enough arguments but output file isn't writable and input file isn't writable -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 6: enough arguments but output file isn't writable and input file isn't writable\n";

touch test_file_nb_6
chmod 000 test_file_nb_6

output=$($corr_path/pipex test_file_nb_6 "ls -l" "grep ." test_file_nb_3 2>&1)

line_count=$(echo "$output" | grep test_file_nb_6 | grep "denied" | wc -l)
line_count2=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
((line_count_tot= line_count + line_count2))
line_count_tot2=$(echo "$output" | wc -l)

if [ "$line_count_tot" -eq 2 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count_tot2" -gt 0 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN OUTPUT FILE ISNT'T WRITABLE AND INPUT FILE ISN'T READABLE\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 7: enough arguments but one cmd isn't a real command -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 7: enough arguments but one cmd isn't a real command\n";

output=$($corr_path/pipex test_file.txt "sefsef" "grep ." out 2>&1)

line_count=$(echo "$output" | grep sefsef | grep "command not found" | wc -l)
line_count2=$(echo "$output" | wc -l)

if [ "$line_count" -eq 1 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count2" -eq 1 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN ONE COMMAND IS NOT FOUND\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 8: enough arguments but two cmds isn't real commands -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 8: enough arguments but two cmds aren't real commands\n";

output=$($corr_path/pipex test_file.txt "sefsef" "ersgeggse" out 2>&1)

line_count=$(echo "$output" | grep sefsef | grep "command not found" | wc -l)
line_count2=$(echo "$output" | grep ersgeggse | grep "command not found" | wc -l)
((line_count_tot= line_count + line_count2))
line_count_tot2=$(echo "$output" | wc -l)

if [ "$line_count_tot" -eq 2 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count_tot2" -gt 0 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN ONE COMMAND IS NOT FOUND\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 9: enough arguments but one cmd isn't a real command, input file isn't readable and output file isn't writable -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 9: enough arguments but one cmd isn't a real command, input file isn't readable and output file isn't writable\n";

output=$($corr_path/pipex test_file_nb_6 "sefse" "ls -l" test_file_nb_3 2>&1)

line_count=$(echo "$output" | grep test_file_nb_6 | grep "denied" | wc -l)
line_count2=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
((line_count_tot= line_count + line_count2))
line_count_tot2=$(echo "$output" | wc -l)

if [ "$line_count_tot" -eq 2 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count_tot2" -gt 0 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN ONE COMMAND IS NOT FOUND, OUTPUT FILE ISNT'T WRITABLE AND INPUT FILE ISN'T READABLE\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 10: enough arguments but two cmds aren't real commands, input file isn't readable and output file isn't writable -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 10: enough arguments but two cmds aren't real commands, input file isn't readable and output file isn't writable\n";

output=$($corr_path/pipex test_file_nb_6 "sefse" "dfgdd" test_file_nb_3 2>&1)

line_count=$(echo "$output" | grep test_file_nb_6 | grep "denied" | wc -l)
line_count2=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
((line_count_tot= line_count + line_count2))
line_count_tot2=$(echo "$output" | wc -l)

if [ "$line_count_tot" -eq 2 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count_tot2" -gt 0 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN TWO COMMANDS ARE NOT FOUND, OUTPUT FILE ISNT'T WRITABLE AND INPUT FILE ISN'T READABLE\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 11: enough arguments but one cmd isn't a real command, input file doesn't exist and output file isn't writable -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 11: enough arguments but one cmd isn't a real command, input file doesn't exist and output file isn't writable\n";

output=$($corr_path/pipex mmmmmmmmmm "sefse" "ls -l" test_file_nb_3 2>&1)

line_count=$(echo "$output" | grep mmmmmmmmmm | grep "such file or directory" | wc -l)
line_count2=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
((line_count_tot= line_count + line_count2))
line_count_tot2=$(echo "$output" | wc -l)

if [ "$line_count_tot" -eq 2 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count_tot2" -gt 0 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN ONE COMMAND IS NOT FOUND, OUTPUT FILE ISNT'T WRITABLE AND INPUT FILE DOESN'T EXIST{DEF_COLOR}\n\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex error 12: enough arguments but two cmds aren't real commands, input file doesn't exist and output file isn't writable -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex error 12: enough arguments but two cmds aren't real commands, input file doesn't exist and output file isn't writable\n";

output=$($corr_path/pipex mmmmmmmmmm "sefse" "dfgdd" test_file_nb_3 2>&1)

line_count=$(echo "$output" | grep mmmmmmmmmm | grep "such file or directory" | wc -l)
line_count2=$(echo "$output" | grep test_file_nb_3 | grep "denied" | wc -l)
((line_count_tot= line_count + line_count2))
line_count_tot2=$(echo "$output" | wc -l)

if [ "$line_count_tot" -eq 2 ]; then
    printf ${GREEN}"OK. SAME ERROR OCCURED\n";
	((COUNTG++))
elif [ "$line_count_tot2" -gt 0 ]; then
    printf ${YELLOW}"OK. AN ERROR OCCURED BUT IS NOT THE SAME AS THE REAL ONE\n";
	((COUNTY++))
else
    printf ${RED}"KO. PIPEX DOESN'T HAVE AN ERROR WHEN TWO COMMANDS ARE NOT FOUND, OUTPUT FILE ISNT'T WRITABLE AND INPUT FILE DOESN'T EXIST\n\n"
	((COUNTR++))
fi
((TOT++))




if [ "$COUNTG" -eq "$TOT" ]; then
	printf ${GREEN}"\n\n------------------------------------------------------------------------------------------------------------------------\n"
    printf "\n\t\t\t\t   \e[4mALL TESTS PASSED PERFECTLY CONGRATULATIONS 🎉\e[0m\n\n";
	printf ${GREEN}"------------------------------------------------------------------------------------------------------------------------\n"
elif [ "$COUNTR" -eq 0 ]; then
	printf ${YELLOW}"\n\n------------------------------------------------------------------------------------------------------------------------\n\n"
	printf "\t\t \e[4mALL TESTS PASSED BUT SOME ARE NOT QUITE THE SAME AS THE REAL COMMAND ERROR OUTPUT ⚠️\e[0m\n\n";
	if [ "$COUNTG" -gt 0 ]; then
    	printf ${GREEN}"\t\t\t\t\t↪ "$COUNTG"/"$TOT" PASSED PERFECTLY\n";
	fi
	if [ "$COUNTY" -gt 0 ]; then
		printf ${YELLOW}"\t\t\t\t\t↪ "$COUNTY"/"$TOT" PASSED BUT NOT PERFECTLY\n\n";
	fi
	printf ${YELLOW}"------------------------------------------------------------------------------------------------------------------------\n\n"
else
	printf ${RED}"\n\n------------------------------------------------------------------------------------------------------------------------\n"
    printf "\t\t\t      \e[4mSOME TESTS HAVE FAILED, CHECK THE TRACE TO HAVE SOME HELP 🚫\e[0m\n\n";
    if [ "$COUNTG" -gt 0 ]; then
	    printf ${GREEN}"\t\t\t\t\t     ↪ "$COUNTG"/"$TOT" PASSED PERFECTLY \n";
	fi
    if [ "$COUNTY" -gt 0 ]; then
		printf ${YELLOW}"\t\t\t\t\t     ↪ "$COUNTY"/"$TOT" PASSED BUT NOT PERFECTLY\n";
	fi
	if [ "$COUNTR" -gt 0 ]; then
		printf ${RED}"\t\t\t\t\t     ↪ "$COUNTR"/"$TOT" FAILED\n\n";
	fi
	printf ${RED}"------------------------------------------------------------------------------------------------------------------------\n\n"
fi







# MORE ERRORS TEST TO COME LATER ON









printf ${MAGENTA}"\n------------------------------------------------------------------------------------------------------------------------\n";
printf "\n\t\t\t\t\t  FUNCTION WRITES, ALLOCS AND CLOSE FDS\t\n";
printf "\n------------------------------------------------------------------------------------------------------------------------\n\n";

VALGRIND=$PWD/.valgrindrc
TOT=0
COUNTG=0
COUNTR=0
COUNTY=0

if [ -f "$VALGRIND" ]; then
	printf "Valgrind configuration found.\n\n"
else
    printf "Valgrind configuration file not found.... Creating one...\n\n"
    echo "--track-fds=yes" > $VALGRIND
	echo "--track-origins=yes" >> $VALGRIND
	echo "--keep-debuginfo=yes" >> $VALGRIND
	echo "--leak-check=full" >> $VALGRIND
	echo "--show-leak-kinds=all" >> $VALGRIND
fi

printf ${RED}"\t\t\t\t\t   ⚠️  \e[4m\e[1mPLEASE READ CAREFULLY\e[0m ⚠️\n"
printf ${RED}"\t\t\t    \e[4m\e[1mVSCODE OPENS FILE DESCRIPTORS ITSELF WITHOUT CLOSING THEM\e[0m\n"
printf ${RED}"\t\t     \e[4m\e[1mIF YOU RUN THIS TESTER IN VSCODE IT WILL MOST OF THE TIMES GIVE YOU ERRORS\e[0m\n"
printf ${RED}"\t\t\t\t\e[4m\e[1mEVEN IF YOU ARE CLOSING EVERY FILE DESCRIPTORS!\e[0m\n"
printf ${RED}"\t\t       \e[4m\e[1mIF YOU UNDERSTAND THIS PLEASE TRY THE TESTER IN A TERMINAL NOT VSCODE.\e[0m\n\n\n\n\n${RED}\e[4m\e[1m"
read -p "If understood, press enter to continue..." </dev/tty

printf ${MAGENTA}"\nRunning valgrind...\n"

# -=-=-=-=-    Testing pipex fds' 1: enough arguments -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex fds' 1: enough arguments\n";

COUNT=1

output=$(valgrind $corr_path/pipex test_file.txt "grep ." "ls -l" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}"OK.\n";
	((COUNTG++))
else
    printf ${RED}"FKO.\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex fds' 2: errors encountered -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex fds' 2: errors encountered\n";

output=$(valgrind $corr_path/pipex test_file.txt "esfe" "ls -l" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file.txt "grep ." "sefes" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file.txt "sefsefs" "sefes" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file.txt "grep ." "ls -l" test_file_nb_3 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex awda.txt "grep ." "ls -l" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex awda.txt "sefesfe" "ls -l" test_file_nb_3 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex awda.txt "grep ." "sefsefs" test_file_nb_3 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex awda.txt "grep ." "sefsefs" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex awda.txt "sefsese" "sefsefs" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))


output=$(valgrind $corr_path/pipex test_file_nb_6 "grep ." "ls -l" test_file_nb_3 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))

((COUNT++))
output=$(valgrind $corr_path/pipex test_file_nb_6 "sefsefse" "awdawwda" test_file_nb_3 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_6 "sefessf" "ls -l" test_file_nb_3 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex $PWD/pipex_tester.sh "cat" "cat" out 2>&1)


error1=$(echo "$output" | grep "Open file descriptor" | wc -l)
error2=$(echo "$output" | grep "File descriptor" | grep "is already closed" | wc -l)
error3=$(echo "$output" | grep "Originally opened" | wc -l)
error4=$(echo "$output" | grep "Previously closed" | wc -l)
((line_count=error1+error2+error3+error4))


if [ "$line_count" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

# -=-=-=-=-    Testing pipex alloc's 3: enough arguments -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\n\nTesting pipex alloc's 3: enough arguments\n";

COUNT=1

output=$(valgrind $corr_path/pipex test_file.txt "grep ." "ls -l" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -eq 1 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}"OK.\n";
	((COUNTG++))
else
    printf ${RED}"FKO.\n"
	((COUNTR++))
fi
((TOT++))

# -=-=-=-=-    Testing pipex alloc's 4: errors encountered -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\nTesting pipex alloc's 4: errors encountered\n";

output=$(valgrind $corr_path/pipex test_file.txt "sefsefs" "ls -l" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file.txt "grep ." "sefsefse" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file.txt "sefsef" "sefse" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_3 "grep ." "ls -l" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_3 "sfsef" "ls -l" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))


output=$(valgrind $corr_path/pipex test_file_nb_3 "sefsfese" "sefsef" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_3 "ls -l" "wc -w" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_3 "grep ." "sefsef" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_3 "sefsefse" "sefsef" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_3 "sefsefse" "wc -w" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex test_file_nb_3 "ls -l" "wc -w" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "grep ." "ls -l" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "sefse" "ls -l" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "grep ." "sefesf" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "seseff" "sefsef" test_file_nb_6 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "grep ." "ls -l" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "sefsef" "ls -l" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "grep ." "sefess" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

output=$(valgrind $corr_path/pipex mmmmmmmmmmmmm "sefsef" "sefse" out 2>&1)


no_error=$(echo "$output" | grep "All heap blocks were freed -- no leaks are possible" | wc -l)
error1=$(echo "$output" | grep "LEAK SUMMARY:" | wc -l)
error2=$(echo "$output" | grep "blocks are still reachable in loss record" | wc -l)
error3=$(echo "$output" | grep "blocks are definitely lost in loss record" | wc -l)
error4=$(echo "$output" | grep "unitialized value" | wc -l)
((tot_error=error1+error2+error3+error4))


if [ "$no_error" -gt 0 ] && [ "$tot_error" -eq 0 ]; then
    printf ${GREEN}""$COUNT":OK. ";
	((COUNTG++))
else
    printf ${RED}""$COUNT":FKO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))




# -=-=-=-=-    Testing pipex's result 5: enough arguments -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

printf ${CYAN}"\n\nTesting pipex's result 5: enough arguments\n";

COUNT=1

$corr_path/pipex test_file.txt "cat" "cat" fpipex
< test_file.txt cat | cat > rpipex

if cmp --silent -- "$PWD/fpipex" "$PWD/rpipex"; then
	printf ${GREEN}""$COUNT":OK. "
	((COUNTG++))
else
	printf ${RED}""$COUNT":KO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

$corr_path/pipex test_file.txt "ls -l" "wc -l" fpipex
< test_file.txt ls -l | wc -l > rpipex

if cmp --silent -- "$PWD/fpipex" "$PWD/rpipex"; then
	printf ${GREEN}""$COUNT":OK. "
	((COUNTG++))
else
	printf ${RED}""$COUNT":KO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

$corr_path/pipex test_file.txt "cat" "wc -w" fpipex
< test_file.txt cat | wc -w > rpipex

if cmp --silent -- "$PWD/fpipex" "$PWD/rpipex"; then
	printf ${GREEN}""$COUNT":OK. "
	((COUNTG++))
else
	printf ${RED}""$COUNT":KO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

$corr_path/pipex test_file.txt "cat" "head -n 5" fpipex
< test_file.txt cat | head -n 5 > rpipex

if cmp --silent -- "$PWD/fpipex" "$PWD/rpipex"; then
	printf ${GREEN}""$COUNT":OK. "
	((COUNTG++))
else
	printf ${RED}""$COUNT":KO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

$corr_path/pipex test_file.txt "ls -l -a -r" "grep .c" fpipex
< test_file.txt ls -l -a -r | grep .c > rpipex

if cmp --silent -- "$PWD/fpipex" "$PWD/rpipex"; then
	printf ${GREEN}""$COUNT":OK. "
	((COUNTG++))
else
	printf ${RED}""$COUNT":KO. "
	((COUNTR++))
fi
((TOT++))
((COUNT++))

# -=-=-=-=-    Testing pipex's result 6: errors encountered -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- #

COUNT=1

printf ${CYAN}"\n\nTesting pipex's result 6: errors encountered\n";

output=$($corr_path/pipex test_file.txt "cat" "cat" fpipex 2>&1)
line=$(echo "$output" | grep "denied" | wc -l)
< test_file.txt cat | > r1pipex
output=$(< test_file.txt cat | "" > r2pipex 2>&1)
line2=$(echo "$output" | grep "denied" | wc -l)

if cmp --silent -- "$PWD/fpipex" "$PWD/r1pipex" || [ "$line" -eq "$line2" ]; then
	printf ${GREEN}""$COUNT":OK. "
	((COUNTG++))
else
	printf ${RED}""$COUNT":KO. "
	((COUNTR++))
fi

((TOT++))
((COUNT++))





if [ "$COUNTG" -eq "$TOT" ]; then
	printf ${GREEN}"\n\n------------------------------------------------------------------------------------------------------------------------\n"
    printf "\n\t\t\t\t   \e[4mALL TESTS PASSED PERFECTLY CONGRATULATIONS 🎉\e[0m\n\n";
	printf ${GREEN}"------------------------------------------------------------------------------------------------------------------------\n"
elif [ "$COUNTR" -eq 0 ]; then
	printf ${YELLOW}"\n\n------------------------------------------------------------------------------------------------------------------------\n\n"
	printf "\t\t \e[4mALL TESTS PASSED BUT SOME ARE NOT QUITE THE SAME AS THE REAL COMMAND ERROR OUTPUT ⚠️\e[0m\n\n";
	if [ "$COUNTG" -gt 0 ]; then
    	printf ${GREEN}"\t\t\t\t\t↪ "$COUNTG"/"$TOT" PASSED PERFECTLY\n";
	fi
	if [ "$COUNTY" -gt 0 ]; then
		printf ${YELLOW}"\t\t\t\t\t↪ "$COUNTY"/"$TOT" PASSED BUT NOT PERFECTLY\n\n";
	fi
	printf ${YELLOW}"------------------------------------------------------------------------------------------------------------------------\n\n"
else
	printf ${RED}"\n\n------------------------------------------------------------------------------------------------------------------------\n"
    printf "\t\t\t      \e[4mSOME TESTS HAVE FAILED, CHECK THE TRACE TO HAVE SOME HELP 🚫\e[0m\n\n";
    if [ "$COUNTG" -gt 0 ]; then
	    printf ${GREEN}"\t\t\t\t\t     ↪ "$COUNTG"/"$TOT" PASSED PERFECTLY \n";
	fi
    if [ "$COUNTY" -gt 0 ]; then
		printf ${YELLOW}"\t\t\t\t\t     ↪ "$COUNTY"/"$TOT" PASSED BUT NOT PERFECTLY\n";
	fi
	if [ "$COUNTR" -gt 0 ]; then
		printf ${RED}"\t\t\t\t\t     ↪ "$COUNTR"/"$TOT" FAILED\n\n";
	fi
	printf ${RED}"------------------------------------------------------------------------------------------------------------------------\n\n"
fi









































































































rm -f out test_file_nb_3 test_file_nb_6 test_file.txt rpipex fpipex r1pipex r2pipex