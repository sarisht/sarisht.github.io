---
title: 'Perils of Parallelism: Transaction Fee Mechanisms under Execution Uncertainty'
authors:
- Sarisht Wadhwa
- Aviv Yaish
- Fan Zhang
- Kartik Nayak
date: '2026-01-01'
publishDate: '2026-08-11T03:25:50.166908Z'
publication_types:
- article-journal
publication: '*35th USENIX Security Symposium*'
links:
- name: URL
  url: https://arxiv.org/pdf/2604.04193

abstract: Modern blockchains increasingly rely on parallel execution to improve throughput. We show several industry and academic transaction fee mechanisms (TFMs) struggle to simultaneously account for execution parallelism while remaining performant and fair. First, if parallelism affects fees, adversarial protocol manipulations that offset possible benefits to throughput by introducing fake transactions become rational: users can insert functionally useless parallel transactions solely to reduce fees, and schedulers can create useless sequential transactions to increase revenue. Execution contingency, a core feature of expressive programming languages, both exacerbates the aforementioned threats and introduces new ones: (1) users may overpay for unused resources, and (2) scheduler revenue is harmed when reserved scheduling slots go unused due to contingency. We introduce a framework for this challenging setting, and prove an impossibility, highlighting an inherent tension: both parallelism and contingency involve a trade-off between minimizing risks for users and schedulers, as favoring one comes at the expense of the other. To complete the picture, we introduce a fee mechanisms and prove that they achieve the boundaries of this trade-off. Our results provide rigorous foundations for evaluating designs advanced by notable blockchains, such as Sui and Monad.

tags:
  - Blockchains Security, Parallel Execution, Transaction Fee Mechanism, Uncertain Execution

---