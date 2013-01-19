# ContactChooser plugin for Cordova / PhoneGap

This Plugin brings up a native iOS or Android contact-picker overlay, accessing the addressbook and returning the selected contact's name and email.

## Usage

Example Usage

```js
window.plugins.ContactChooser.chooseContact(function(contactInfo){
    alert(contactInfo.displayName + " " + contactInfo.email);
});
```

The method which will return a JSON. Example:

```json
{
    displayName: "John Doe",
    email: "john.doe@mail.com"
}
```

## Requirements

This has been tested for Cordova versions 2.2.0 and 2.3.0

## iOS

### Cordova 2.3.x
In Cordova 2.3.0 the format of the configuration has changed. The `.plist` based config has been dropped in favour of an XML file `config.xml`. The plugin has to be added to the `<plugins>` section of this file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<cordova>
    ...
	<plugins>
    	...
	    <plugin name="ContactChooser" value="ContactChooser"/>
		...
    </plugins>
	...
</cordova>
```

### Cordova 2.2.x

Cordova 2.2.0 still uses the `Cordova.plist` configuration und thus the plugin has to be added as key value pair in the Plugins section of that file with key `ContactChooser` and value `ContactChooser`.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	... 
	<key>Plugins</key>
	<dict>
		...
		<key>ContactChooser</key>
		<string>ContactChooser</string>
	</dict>
</dict>
</plist>
```

## Android

First you should maybe customize the package in `ContactChooserPlugin.java`. The plugin has to be registered in the Cordova `config.xml` in the `<plugins>` section, make sure to get the package right:

```xml
<?xml version="1.0" encoding="utf-8"?>
<cordova>
    ...
    <plugins>
        ...
        <plugin name="ContactChooser" value="com.mypackage.name.ContactChooserPlugin" />
    </plugins>
</cordova>
```

## MIT Licence

Copyright 2013 Monday Consulting GmbH

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
