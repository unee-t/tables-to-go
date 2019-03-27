package dto

import (
	"database/sql"
)

type PersonStatuses struct {
	IdPersonStatus         int            `db:"IdPersonStatus"`
	CreationSystemId       int            `db:"CreationSystemId"`
	UpdateSystemId         sql.NullInt64  `db:"UpdateSystemId"`
	IsObsolete             sql.NullInt64  `db:"IsObsolete"`
	IsDefault              sql.NullInt64  `db:"IsDefault"`
	IsActive               sql.NullInt64  `db:"IsActive"`
	Order                  int            `db:"Order"`
	PersonStatusDefinition sql.NullString `db:"PersonStatusDefinition"`
}
