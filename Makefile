tests: bootstrap sort units printArt

ci: local-bootstrap sort units

bootstrap:
	@carthage bootstrap

bump:
	@./bin/bumpBuild.sh

clean:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeLunch" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.1,name=iPhone 7" clean

local-bootstrap:
	@carthage bootstrap --platform iOS --no-use-binaries

printArt:
	@./bin/printArt.sh

sort:
	perl ./bin/sortXcodeProject OsusumeLunch.xcodeproj/project.pbxproj

units: osusumeUnits networkingUnits

osusumeUnits:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeLunch" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.1,name=iPhone 7" build test

networkingUnits:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeNetworking" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.1,name=iPhone 7" build test

update:
	@carthage update --platform iOS
