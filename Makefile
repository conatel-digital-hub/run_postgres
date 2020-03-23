.PHONY: release

release:
	git commit -m "released version" \
	&& git tag -a $(VERSION) -m "$(VERSION)" \
	&& git push origin master \
	&& git push origin --tags