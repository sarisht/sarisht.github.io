---
title: 'Data Independent Order Policy Enforcement: Limitations and Solutions'
authors:
- Sarisht Wadhwa
- Luca Zanolini
- Francesco D'Amato
- Aditya Asgaonkar
- Chengrui Fang
- Fan Zhang
- Kartik Nayak
date: '2024-12-09'
doi: '10.1145/3658644.367036'
publishDate: '2024-12-10T03:25:50.166908Z'
publication_types: ['paper-conference']

# Publication name and optional abbreviated publication name.
publication: In *Proceedings of the 2024 on ACM SIGSAC Conference on Computer and Communications Security*
publication_short: In *ACM CCS 2024*

abstract: Order manipulation attacks such as frontrunning and sandwiching have become an increasing concern in blockchain applications such as DeFi. To protect from such attacks, several recent works have designed order policy enforcement (OPE) protocols to order transactions fairly in a data-independent fashion. However, while the manipulation attacks are motivated by monetary profits, the defenses assume honesty among a significantly large set of participants. In existing protocols, if all participants are rational, they may be incentivized to collude and circumvent the order policy without incurring any penalty. This work makes two key contributions. First, we explore whether the need for the honesty assumption is fundamental. Indeed, we show that it is impossible to design OPE protocols under some requirements when all parties are rational. Second, we explore the tradeoffs needed to circumvent the impossibility result. In the process, we propose a novel concept of rationally binding transactions that allows us to construct AnimaguSwap, the first content-oblivious Automated Market Makers (AMM) interface that is secure under rationality. We report on a prototype implementation of AnimaguSwap and performance evaluation results demonstrating its practicality.

tags:
  - Blockchains Security

# Display this page in the Featured widget?
featured: true
---
