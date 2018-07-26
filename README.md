# shOTPad

"In cryptography, the [one-time pad (OTP)][1] is an encryption technique that cannot be cracked if used correctly."

It is fairly easy to do with pen and paper, yet still time consuming. That is why I started working on this script in late 2015, so anyone could easily utilise this amazing encryption technique.

The other reason for creating it was to give myself a challenge. The most challanging part was to translate the technique from pen and paper to bash script, and then how to sequence it.

### How to deploy and use securely

If your hard drive is encrypted it should be fairly safe to keep shOTPad on there with your pads. However, the more ideal choice would be to keep them on an encrypted thumb drive.

Passing on a pad to your contact is best done in person, preferably on an encrypted thumb drive. Your second choice would be online through any encrypted channel, such as encrypted email.

### Install and Upgrade

Go to the path where you want to install it.

If you run *install_shotpad.sh* in /home/USER/ it will be installed to /home/USER/shOTPad

`wget -q -N --show-progress https://raw.githubusercontent.com/DokterW/shOTPad/master/install_shotpad.sh`

`chmod +x install_shotpad.sh`

`./install_shotpad.sh`

### How the one-time pads work

Keep in mind that one pad is for you, and one is for your contact.

It is a two-way communication like a HAM radio. First one person sends a message, then the sender have to wait for the other to respond. This so the pads match, or else both encryption and decryption will be incorrectly done.

As an example, Bob writes:

HELLOAREYOUOK

This will use and remove 13 characters from Bob's pad.

Alice receives this message encrypted and will use the 13 characters in her pad, that is equal to Bob's, to decrypt Bob's message.

Then Alice writes back:

HIIAMFINE

This uses and removes the next 9 characters in Alice's pad. These 9 characters are the next characters in Bob's pad that he will have to use to decrypt Alice's response.

So be careful when sending each other messages.

**Always encrypt and send one message, then wait for a response.**

Arrange this when you share a pad, that you either take turns in messaging each other, set a specific time when you alternate who can send or someone can send a second message if they have not received a response.

### How to use shOTPad

The script itself is created to be very straight forward and simple. If you know and understand how the one-time pad encryption works, the script itself should be self-explanatory.

A sample pad is included, *otp-sample.pad*. Play around with it as much as you like. **Do not ever use to for messaging a contact!**

### Roadmap

* n/a

### Changelog

#### 2018-07-26
* Updated the UI to make it more efficient and usable.
* Added an install and upgrade script.

#### 2018-07-25
* Character reading has been improved and mod26 has no need for a dirty fix.
* Major bug has been squashed! Previous version did not correctly encrypt. Example: Letter C with OTP letter C should have become F, but instead it turned into an E. This is now corrected! Sorry for the inconvenience. However, this would not effect the encryption if messages were exchanged within shOTPad.

#### 2016-11-19
* Put the whole script in one file.

[1]: https://en.wikipedia.org/wiki/One-time_pad
