#let setup-page(
  font: "New Computer Modern",
  font-size: 10pt,
  lang: "en",
  paper: "us-letter",
  margin: 0.5in,
  accent-color: "#000000",
  header1-position: left,
  header1-font-size: 20pt,
  body,
) = {
  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: font,
    size: font-size,
    lang: lang,
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false,
  )

  // Reccomended to have 0.5in margin on all sides
  set page(margin: margin, paper: paper)

  // Link styles
  show link: underline

  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Accent Color Styling
  show heading: set text(fill: rgb(accent-color))

  show link: set text(fill: rgb(accent-color))

  show heading.where(level: 1): it => [
    #set align(header1-position)
    #set text(weight: 700, size: header1-font-size)
    #pad(it.body)
  ]

  body
}

// Personal Info Helper
#let contact-item(value, prefix: "", link-type: "") = {
  if value != "" {
    if link-type != "" {
      link(link-type + value)[#(prefix + value)]
    } else {
      value
    }
  }
}


// Generic two by two component for resume
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  [
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

#let entry(
  img: "",
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
  table_stroke: 0pt,
) = {
  table(
    columns: (if img != "" { (auto,) } else { () }) + (auto,),
    stroke: table_stroke,
    ..if img != "" {
      ([ #image(height: 2em, img, fit: "contain") ],)
    } else {
      ()
    },
    [
      #top-left #h(1fr) #top-right \
      #bottom-left #h(1fr) #bottom-right
    ]
  )
}

#let work-entry(
  work,
  table_stroke: 0pt,
) = {
  entry(
    img: work.at("logo", default: ""),
    top-left: strong(work.position),
    top-right: "Jun 2011 - Aug 2024",
    bottom-left: work.name,
    bottom-right: emph(work.location),
    table_stroke: table_stroke,
  )
  v(0.2em, weak: true) // TODO par.leading?
  // [ \ ]
  // work.summary
  if work.highlights != () {
    list(tight: true, ..work.highlights)
  }
  // TODO join as highlights?
  // work.keywords.join(" | ")
  // parbreak()
}

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  [
    #left #h(1fr) #right
  ]
}

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}

