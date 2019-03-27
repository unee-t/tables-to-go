package dto

import (
	"database/sql"

	"github.com/lib/pq"
)

type Persons struct {
	IdPerson             int            `db:"IdPerson"`
	ExternalId           string         `db:"ExternalId"`
	ExternalSystem       string         `db:"ExternalSystem"`
	ExternalTable        string         `db:"ExternalTable"`
	SystCreatedDatetime  pq.NullTime    `db:"SystCreatedDatetime"`
	CreationSystemId     sql.NullInt64  `db:"CreationSystemId"`
	CreatedById          sql.NullString `db:"CreatedById"`
	SystUpdatedDatetime  pq.NullTime    `db:"SystUpdatedDatetime"`
	UpdateSystemId       sql.NullInt64  `db:"UpdateSystemId"`
	UpdatedById          sql.NullString `db:"UpdatedById"`
	PersonStatusId       sql.NullInt64  `db:"PersonStatusId"`
	DupeId               sql.NullInt64  `db:"DupeId"`
	HandlerId            sql.NullInt64  `db:"HandlerId"`
	IsUneeTAccountNeeded sql.NullInt64  `db:"IsUneeTAccountNeeded"`
	CountryCode          sql.NullString `db:"CountryCode"`
	Gender               sql.NullInt64  `db:"Gender"`
	SalutationId         sql.NullInt64  `db:"SalutationId"`
	GivenName            string         `db:"GivenName"`
	MiddleName           sql.NullString `db:"MiddleName"`
	FamilyName           sql.NullString `db:"FamilyName"`
	DateOfBirth          pq.NullTime    `db:"DateOfBirth"`
	Alias                sql.NullString `db:"Alias"`
	JobTitle             sql.NullString `db:"JobTitle"`
	Organization         sql.NullString `db:"Organization"`
	Email                sql.NullString `db:"Email"`
	Tel1                 sql.NullString `db:"Tel1"`
	Tel2                 sql.NullString `db:"Tel2"`
	Whatsapp             sql.NullString `db:"Whatsapp"`
	Linkedin             sql.NullString `db:"Linkedin"`
	Facebook             sql.NullString `db:"Facebook"`
	Adr1                 sql.NullString `db:"Adr1"`
	Adr2                 sql.NullString `db:"Adr2"`
	Adr3                 sql.NullString `db:"Adr3"`
	City                 sql.NullString `db:"City"`
	ZipPostcode          sql.NullString `db:"ZipPostcode"`
	RegionOrState        sql.NullString `db:"RegionOrState"`
	Country              sql.NullString `db:"Country"`
}
