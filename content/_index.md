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
  - block: collection
    id: news
    content:
      title: '📰 News'
      text: ''
      count: 7
      filters:
        folders:
          - news
        exclude_future: false
        exclude_past: false
      offset: 0
      order: desc
    design:
      view: date-title-summary
      spacing:
        padding: [0, 0, 0, 0]
  - block: markdown
    content:
      text: '[See all news →](news/)'
    design:
      columns: '1'
      spacing:
        padding: [0, 0, 0, 0]
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
