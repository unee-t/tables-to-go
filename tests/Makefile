up:
	docker-compose up -d
gen:
	../tables-to-go -v -t mysql -d unee_t_enterprise -u root -p secret -of .
clean:
	docker-compose down -v
	rm -f *.go
