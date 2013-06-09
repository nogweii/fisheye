# fisheye - A multi-tenant, multi-protocol identity provider

[![Dependency Status](https://gemnasium.com/evaryont/fisheye.png)](https://gemnasium.com/evaryont/fisheye)

Me, online, in all of it's fabulousness. Also, it tries really hard to be the
one-stop-shop for all of my authentication needs. Which currently are:

- BrowserID
- OpenID

This application is fairly barebones, it doesn't need to do much outside of
authenticating a person. It's not a web site -- it only does OpenID & BrowserID,
and even then, it doesn't actually do that itself, thanks to the fantastic Ruby
community. :smile: This is mostly glue so that other libraries are exposed.

Fisheye is designed to be multi-tenant, meaning that it is not only for just one
person, but any number of people can use it.

## Thanks

- [masq](https://github.com/dennisreimann/masq)
- [browserid-provider](https://github.com/ringe/browserid-provider)

## Features

- Single-sign-on across all identities -- they aren't just 2+ protocols that
  happen to be on the same server, but they are indeed supposed to be different
  representations of the exact same user. (Which of course means that your
  password works for both OpenID **and** BrowserID!)
- Includes [VeriSign's SeatBelt][seatbelt] configuration (thanks to masq),
  which is a Firefox plugin that will auto-fill OpenID input fields on websites
  that support OpenID. Neat!
- Email activation, 'cause it's nice to know that there is a real email on the
  other side of these identities.

[seatbelt]: https://pip.verisignlabs.com/seatbelt.do

## Setup

1. Download fisheye:
   ```bash
   git clone https://github.com/evaryont/fisheye.git
   ```

2. Make sure all of the dependencies are installed:
   ```bash
   bundle install --deployment
   ```

3. Edit the configuration file for masq:
   ```bash
   vim config/masq.yml
   ```

4. Run migrations to get the DB schema loaded:
   ```bash
   bundle exec rake db:migrate
   ```

When you first run Rails, `browserid-provider` will generate a private certificate
in config/browserid\_provider.pem. Keep it safe.

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
