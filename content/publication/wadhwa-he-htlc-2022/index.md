---
title: 'He-htlc: Revisiting incentives in htlc'
authors:
- Sarisht Wadhwa
- Jannis Stoeter
- Fan Zhang
- Kartik Nayak
date: '2022-01-01'
publishDate: '2024-12-10T03:25:50.166908Z'
publication_types:
- article-journal
publication: '*Cryptology ePrint Archive*'
links:
- name: URL
  url: https://eprint.iacr.org/2022/546
abstract: Hashed Time-Locked Contracts (HTLCs) are a widely used primitive in blockchain systems such as payment channels, atomic swaps, etc. Unfortunately, HTLC is incentive-incompatible and is vulnerable to bribery attacks. The state-of-the-art solution is MAD-HTLC (Oakland'21), which proposes an elegant idea that leverages miners' profit-driven nature to defeat bribery attacks. In this paper, we show that MAD-HTLC is still vulnerable as it only considers a somewhat narrow set of passive strategies by miners. Through a family of novel reverse-bribery attacks, we show concrete active strategies that miners can take to break MAD-HTLC and profit at the loss of MAD-HTLC users. For these attacks, we present their implementation and game-theoretical profitability analysis. Based on the learnings from our attacks, we propose a new HTLC realization, He-HTLC (Our specification is lightweight and inert to incentive manipulation attacks. Hence, we call it He-HTLC where He stands for Helium.) that is provably secure against all possible strategic manipulation (passive and active). In addition to being secure in a stronger adversary model, He-HTLC achieves other desirable features such as low and user-adjustable collateral, making it more practical to implement and use the proposed schemes. We implemented He-HTLC on Bitcoin and the transaction cost of He-HTLC is comparative to average Bitcoin transaction fees.
---
