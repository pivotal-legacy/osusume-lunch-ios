tests: sort units printArt

ci: units 

clean:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeLunch" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7" clean

units:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeLunch" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7" build test

sort:
	perl ./bin/sortXcodeProject OsusumeLunch.xcodeproj/project.pbxproj

bump:
	@./bin/bumpBuild.sh

printArt:
	@./bin/printArt.sh

