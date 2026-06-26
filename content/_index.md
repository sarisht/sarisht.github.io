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
        url: uploads/resume.pdf
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
    id: news
    content:
      title: '📰 News'
      subtitle: ''
      text: |-
        <style>
        #news .news-more-cb{display:none;}
        #news ul li:nth-child(n+8){display:none;}
        #news .news-more-cb:checked ~ ul li{display:list-item;}
        #news .news-more-cb:checked ~ .news-more-btn{display:none;}
        #news .news-more-btn{display:inline-block;margin-top:0.75rem;cursor:pointer;color:#2563eb;font-weight:600;}
        #news .news-more-btn:hover{text-decoration:underline;}
        </style>
        <input type="checkbox" id="news-more-cb" class="news-more-cb">

        - **Jun 2026** — Excited to join the University of Michigan as a postdoc, hosted by Prof. Ke Wu.
        - **Jun 2026** — Joining the Program Committee for USENIX Security 2027.
        - **Jun 2026** — Talk at IC3 Camp on *Perils of Parallelism*.
        - **May 2026** — Graduated and received my PhD! Deeply grateful to my advisors Prof. Kartik Nayak and Prof. Fan Zhang for their invaluable mentorship, guidance, and unwavering support throughout this journey.
        - **May 2026** — *Perils of Parallelism* accepted at SBC 2026.
        - **May 2026** — *Perils of Parallelism* accepted at USENIX Security 2026.
        - **May 2026** — Talk at Designing DeFi.
        - **Apr 2026** — *Censorship Resistance vs Throughput in Multi-Proposer BFT Protocols* accepted at CCS 2026.
        - **Mar 2026** — Defended my PhD thesis.
        - **Dec 2025** — Talk at CCE on *Perils of Parallelism*.
        - **Nov 2025** — Joining the Program Committees for CCS 2026 and EC 2026.
        - **Aug 2025** — Talk on *AUCIL* at MEV-SBC 2025.

        <label for="news-more-cb" class="news-more-btn">Load more ▾</label>
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
---
