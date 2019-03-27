package dto

import (
	"database/sql"
)

type PersonSalutations struct {
	IdSalutation          int            `db:"IdSalutation"`
	CreationSystemId      int            `db:"CreationSystemId"`
	UpdateSystemId        sql.NullInt64  `db:"UpdateSystemId"`
	IsObsolete            sql.NullInt64  `db:"IsObsolete"`
	Order                 int            `db:"Order"`
	SalutationDescription sql.NullString `db:"SalutationDescription"`
}
