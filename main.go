package main

import (
	"flag"
	"fmt"

	"github.com/fraenky8/tables-to-go/src"
)

type CmdArgs struct {
	// command line args
	Help bool
	*tablestogo.Settings
}

var (
	cmdArgs *CmdArgs
)

func main() {

	cmdArgs = prepareCmdArgs()

	if cmdArgs.Help {
		flag.Usage()
		return
	}

	err := tablestogo.VerifySettings(cmdArgs.Settings)
	if err != nil {
		fmt.Println(err)
		return
	}

	err = tablestogo.Run(cmdArgs.Settings)

	if err != nil {
		fmt.Println(err)
	}
}

func prepareCmdArgs() (cmdArgs *CmdArgs) {

	cmdArgs = &CmdArgs{
		Settings: tablestogo.NewSettings(),
	}

	flag.BoolVar(&cmdArgs.Help, "?", false, "shows help and usage")
	flag.BoolVar(&cmdArgs.Help, "help", false, "shows help and usage")
	flag.BoolVar(&cmdArgs.Verbose, "v", cmdArgs.Verbose, "verbose output")
	flag.StringVar(&cmdArgs.DbType, "t", cmdArgs.DbType, fmt.Sprintf("type of database to use, currently supported: %v", tablestogo.SupportedDbTypes))
	flag.StringVar(&cmdArgs.User, "u", cmdArgs.User, "user to connect to the database")
	flag.StringVar(&cmdArgs.Pswd, "p", cmdArgs.Pswd, "password of user")
	flag.StringVar(&cmdArgs.DbName, "d", cmdArgs.DbName, "database name")
	flag.StringVar(&cmdArgs.Schema, "s", cmdArgs.Schema, "schema name")
	flag.StringVar(&cmdArgs.Host, "h", cmdArgs.Host, "host of database")
	flag.StringVar(&cmdArgs.Port, "port", cmdArgs.Port, "port of database host, if not specified, it will be the default ports for the supported databases")

	flag.StringVar(&cmdArgs.OutputFilePath, "of", cmdArgs.OutputFilePath, "output file path")
	flag.StringVar(&cmdArgs.OutputFormat, "format", cmdArgs.OutputFormat, "camelCase (c) or original (o)")
	flag.StringVar(&cmdArgs.Prefix, "pre", cmdArgs.Prefix, "prefix for file- and struct names")
	flag.StringVar(&cmdArgs.Suffix, "suf", cmdArgs.Suffix, "suffix for file- and struct names")
	flag.StringVar(&cmdArgs.PackageName, "pn", cmdArgs.PackageName, "package name")

	flag.BoolVar(&cmdArgs.IsMastermindStructable, "st", cmdArgs.IsMastermindStructable, "generate struct for use in Masterminds/structable (https://github.com/Masterminds/structable)")
	flag.BoolVar(&cmdArgs.IsMastermindStructableOnly, "sto", cmdArgs.IsMastermindStructableOnly, "generate struct ONLY for use in Masterminds/structable (https://github.com/Masterminds/structable)")
	flag.BoolVar(&cmdArgs.IsMastermindStructableRecorder, "str", cmdArgs.IsMastermindStructableRecorder, "generate a structable.Recorder (requires -st or -sto flag)")

	flag.Parse()

	return cmdArgs
}