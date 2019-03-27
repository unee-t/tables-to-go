up:
	docker-compose up -d
gen:
	tables-to-go -v -t mysql -d unee_t_enterprise -u root -p secret
clean:
	docker-compose down -v
	rm -f *.go
