download_latest_pulumi_installer:
	@echo "Downloading pulumi installer."
	curl --progress-bar -o vendor/install_pulumi.sh "https://get.pulumi.com"
	chmod +x vendor/install_pulumi.sh
