
help:
	@echo 'Exports GitHub commit history for REPOS                                   '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make export              cd in to repo and export commit history (txt) '
	@echo '   make export_csv          cd in to repo and export commit history (csv) '
	@echo '                                                                          '

REPOS_PERSONAL = blog General-Examples GitHub-Commits Map-Tools mkudija.github.io Project-Euler-Solutions recipes
REPOS_WORK = Aircraft-Data BD-Tools CommercialData FleetView MarketView MILE_Data Odin Product-Strategy-Presentations Projects tmp update-websites Valuations Valuations-Internal

export:
	$(foreach var,$(REPOS_PERSONAL), cd ../$(var); git log --date=local --pretty=format:"%h%x09%an%x09%ad%x09%s" > ../GitHub-Commits/txt/commits_Personal_$(var).txt;)
	$(foreach var,$(REPOS_WORK), cd ../$(var); git log --date=local --pretty=format:"%h%x09%an%x09%ad%x09%s" > ../GitHub-Commits/txt/commits_Work_$(var).txt;)

export_csv:
	$(foreach var,$(REPOS_PERSONAL), cd ../$(var); git log --date=local --pretty=format:"%h%x09%an%x09%ad%x09%s" > ../GitHub-Commits/csv/commits_Personal_$(var).csv;)
	$(foreach var,$(REPOS_WORK), cd ../$(var); git log --date=local --pretty=format:"%h%x09%an%x09%ad%x09%s" > ../GitHub-Commits/csv/commits_Work_$(var).csv;)