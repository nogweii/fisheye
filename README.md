# fisheye

Me, online, in all of it's fabulousness. Also, it tries really hard to be the
one-stop-shop for all of my authentication needs. Which currently are:

- BrowserID
- OpenID

This application is fairly barebones, it doesn't need to do much outside of
authenticating a person. It's not a web site -- it only does OpenID & BrowserID,
and even then, it doesn't actually do that thanks to the fantastic Ruby
community. :-)

Fisheye is designed to be multi-tenant, meaning that it is not only for just one
person, but any number of people can use it.

## Thanks

- masq
- browserid-provider

## License

Licensed under the AGPLv3, which simply stated means that even though it's a web
site you must still publish the source code, including any changes.

    Copyright (C) 2013 Colin Shea

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
