---
title: 'Censorship-Resistant Sealed-Bid Auctions on Blockchains'
authors:
- Orestis Alpos
- Lioba Heimbach
- Kartik Nayak
- Sarisht Wadhwa
date: '2025-01-01'
publishDate: '2025-11-20T03:25:50.166908Z'
publication_types:
- article-journal
publication: '*Cryptology ePrint Archive*'
links:
- name: URL
  url: https://eprint.iacr.org/2025/2127

abstract: Traditional commit-and-reveal mechanisms have been used to realize sealed-bid on-chain auctions. However, these leak timing information, impose inefficient participation costs -- the inclusion fee to be paid for adding the transaction on-chain -- and also require multiple slots to execute the auction. Recent research investigates single-slot auctions; however, it requires a high threshold of honest parties. We present a protocol that addresses these issues. Our design combines timestamp-based certificates with censorship resistance through inclusion lists. The resulting protocol satisfies four properties, the first being a strong hiding property which consists of Value Indistinguishability, Existential Obfuscation and User Obfuscation. This not only ensures that the adversary cannot differentiate between two value of bids (as the previously defined Hiding property does in Pranav et al. [MCP]), but also that the very existence of a bid and the identity of the bidder remain obfuscated. The second property is Short-Term Censorship Resistance, ensuring that, if the underlying blockchain outputs a block, then the auction would contain bids from all honest users. The third is a new property we introduce, Auction Participation Efficiency (APE), that measures how closely on-chain outcomes resemble classical auctions in terms of costs for participating users. And the fourth property is No Free Bid Withdrawal, which disallows committed bids from being withdrawn in case the bidder changes its mind. Together, these properties yield a fair, private, and economically robust auction primitive that can be integrated into any blockchain to support secure and efficient auction execution.

tags:
  - Blockchains Security, Censorship Resistance, Sealed-Bid Auction, Privacy

---