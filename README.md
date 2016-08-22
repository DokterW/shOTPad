# shOTPad

"In cryptography, the [one-time pad (OTP)][1] is an encryption technique that cannot be cracked if used correctly."

It is fairly easy to do with pen and paper, yet still time consuming. That is why I started working on this script in late 2015, so anyone could easily uilise this amazing encryption technique.

The other reason for creating it was to give myself a challenge. The most challanging part was to translate the technique from pen and paper to bash script, and then how to sequence it.

### How to deploy and use securely

If your hard drive is encrypted it should be fairly safe to keep shOTPad on there with your pads. However, the more ideal choice would be to keep them on an encrypted thumbdrive.

Passing on a pad to your contact is best done in person, preferably on an encrypted thumbdrive. Your second choice would be online through any encrypted channel, such as encrypted email.

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

The script itself is created to be very straight forward and simple. If you know and understand how the one-time pad encryption works, the script itself should be selfexplanatory.

### Roadmap

* Put the whole script in one file.

_Updated: 2015-09-30_

[1]: https://en.wikipedia.org/wiki/One-time_pad
