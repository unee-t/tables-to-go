package tagger

import (
	"fmt"
	"strings"

	"github.com/fraenky8/tables-to-go/pkg/database"
)

// SQL is the experimental "sql"-tag
type SQL struct{}

// GenerateTag for SQL to satisfy the Tagger interface
func (t SQL) GenerateTag(db database.Database, column database.Column) string {

	colType := ""
	characterMaximumLength := ""
	if db.IsString(column) && column.CharacterMaximumLength.Valid {
		characterMaximumLength = fmt.Sprintf("(%v)", column.CharacterMaximumLength.Int64)
	}

	colType = fmt.Sprintf("type:%v%v;", column.DataType, characterMaximumLength)

	isNullable := ""
	if !db.IsNullable(column) {
		isNullable = "not null;"
	}

	// TODO size:###
	// TODO unique, key, index, ...

	tag := colType + isNullable
	tag = strings.TrimSuffix(tag, ";")

	return `sql:"` + tag + `"`
}
