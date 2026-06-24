---
# Leave the homepage title empty to use the site title
title: "Sarisht Wadhwa"
date: 2022-10-24
type: landing

design:
  # Default section spacing
  spacing: "6rem"

sections:
  - block: resume-biography-3
    content:
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: admin
      text: ""
      # Show a call-to-action button under your biography? (optional)
      button:
        text: Download CV
        url: https://users.cs.duke.edu/~sw485/Sarisht_resume.pdf
    design:
      css_class: dark
      background:
        color: black
        image:
          # Add your image background to `assets/media/`.
          filename: stacked-peaks.svg
          filters:
            brightness: 1.0
          size: cover
          position: center
          parallax: false
  - block: markdown
    content:
      title: '📰 News'
      subtitle: ''
      text: |-
        - **Jun 2026** — Excited to join the University of Michigan as a postdoc, hosted by Prof. Ke Wu.
        - **Jun 2026** — Joining the Program Committee for USENIX Security 2027.
        - **Jun 2026** — Talk at IC3 Camp on *Perils of Parallelism*.
        - **May 2026** — *Perils of Parallelism* accepted at SBC 2026.
        - **May 2026** — *Perils of Parallelism* accepted at USENIX Security 2026.
        - **May 2026** — Talk at Designing DeFi.
        - **Apr 2026** — *Censorship Resistance vs Throughput in Multi-Proposer BFT Protocols* accepted at CCS 2026.
        - **Dec 2025** — Talk at CCE on *Perils of Parallelism*.
        - **Nov 2025** — Joining the Program Committee for CCS 2026 and EC 2026.
        - **Aug 2025** — Talk on *AUCIL* at MEV-SBC 2025.
    design:
      columns: '1'
  - block: markdown
    content:
      title: '📚 My Research'
      subtitle: ''
      text: |-
        My research aims to understand and mitigate the security challenges introduced by strategic privileged players (e.g., block proposers) in decentralized systems. My projects explore both application-specific solutions for incentive manipulation and application-agnostic schemes for Miner’s Extractable Value (MEV) reduction. Overall, my goal is to develop principled methods to achieve accountable decentralized protocols, particularly in the presence of adversarial incentive manipulation attacks.

        Please reach out to collaborate 😃
    design:
      columns: '1'
  - block: collection
    id: papers
    content:
      title: Recent Publications
      text: ""
      filters:
        folders:
          - publication
        exclude_featured: false
    design:
      view: citation
  - block: collection
    id: talks
    content:
      title: Recent & Upcoming Talks
      filters:
        folders:
          - event
    design:
      view: article-grid
      columns: 1
  # - block: collection
  #   id: news
  #   content:
  #     title: Recent News
  #     subtitle: ''
  #     text: ''
  #     # Page type to display. E.g. post, talk, publication...
  #     page_type: post
  #     # Choose how many pages you would like to display (0 = all pages)
  #     count: 5
  #     # Filter on criteria
  #     filters:
  #       author: ""
  #       category: ""
  #       tag: ""
  #       exclude_featured: false
  #       exclude_future: false
  #       exclude_past: false
  #       publication_type: ""
  #     # Choose how many pages you would like to offset by
  #     offset: 0
  #     # Page order: descending (desc) or ascending (asc) date.
  #     order: desc
  #   design:
  #     # Choose a layout view
  #     view: date-title-summary
  #     # Reduce spacing
  #     spacing:
  #       padding: [0, 0, 0, 0]
---
