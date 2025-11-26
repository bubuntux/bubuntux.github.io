#import "@preview/nerd-icons:0.2.0": *
#import "./lib.typ": *

#let json = json("resume.json")

#let location = "San Diego, CA"
#let email = "stxu@hmc.edu"
#let github = "github.com/stuxf"
#let linkedin = "linkedin.com/in/stuxf"
#let phone = "+1 (xxx) xxx-xxxx"
#let personal-site = "stuxf.dev"
#let accent-color = "#26428b"

#let basics = json.basics
#set document(author: basics.name, title: basics.name + "'s Curriculum Vitae")


#show: setup-page.with(
  font: "Source Sans Pro",
  font-size: 10pt,
  lang: "en",
  paper: "us-letter",
  margin: 0.5in,
  accent-color: accent-color,
  header1-position: left,
  header1-font-size: 20pt,
)

// Level 1 Heading
= #(basics.name)

// TODO use profiles
// Personal Info
#pad(top: 0.25em, align(left)[
  #{
    let items = (
      [
        #nf-icon("email") #h(5pt) #link("mainto:" + basics.email)[#basics.email]
      ],
      // contact-item(location),
      [ #nf-icon("github") #link("https://github.com/bubuntux")[bubuntux] ],
      [
        #nf-icon("linkedin") #link(
          "https://www.linkedin.com/in/julio-guti",
        )[julio-guti]
      ],
      [
        #nf-icon("docker") #link("https://hub.docker.com/u/bubuntux")[bubuntux]
      ],
    )
    items.filter(x => x != none).join("  |  ")
  }
])



#set par(justify: true)

== Work Experience
#let max_work = 4
#for work in (json.work.slice(0, max_work)) {
  work-entry(work, table_stroke: 0pt)
}


== Work Experience
#let max_work = 4
#for work in (json.work.slice(0, max_work)) {
  generic-two-by-two(
    top-left: strong(work.position),
    top-right: "Jun 2011 - Aug 2024",
    bottom-left: work.name,
    bottom-right: emph(work.location),
  )
  [ \ ]
  work.summary
  if work.highlights != () {
    list(tight: true, ..work.highlights)
  }
  // TODO join as highlights?
  // work.keywords.join(" | ")
  parbreak()
}

== Projects
#let max_proj = 3
#for proj in json.projects.slice(0, calc.min(max_proj, json.projects.len())) {
  generic-one-by-two(
    left: {
      if "url" in proj and proj.url != "" [
        #link(proj.url)[*#proj.name*]
      ] else [
        *#proj.name*
      ]
    },
    right: {
      [ Jan 2021 - Feb 2026 ]
    },
  )
  [ \ ]
  proj.description
  if proj.highlights != () {
    list(tight: true, ..proj.highlights)
  }
  parbreak()
}

== Certificates
#let max_cert = 3
#for cert in json.certificates.slice(0, calc.min(
  max_cert,
  json.certificates.len(),
)) {
  if cert.url != "" [
    #link(cert.url)[*#cert.name*], #cert.issuer
  ] else [
    *#cert.name*, #cert.issuer
  ]
  [ #h(1fr) #cert.date \ ]
}

== Education
#let max_edu = 3
#for edu in json.education.slice(0, calc.min(max_edu, json.education.len())) {
  generic-two-by-two(
    top-left: strong(edu.studyType + " - " + edu.area),
    top-right: "2004 - 2009",
    bottom-left: emph(edu.institution),
    bottom-right: emph(edu.location),
  )
}
