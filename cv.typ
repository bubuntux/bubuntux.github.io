#import "@preview/brilliant-cv:2.0.6": *
#let metadata = toml("./metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)
#let cvHonor = cvHonor.with(metadata: metadata)
#show: cv.with(metadata, profilePhoto: image("img/avatar.png"))

#let full_name = (
  metadata.personal.first_name + " " + metadata.personal.last_name
)
#set document(author: full_name, title: full_name + "'s Curriculum Vitae")


#cvSection("Professional Experience")
#cvEntry(
  title: [Data Analyst],
  society: [ABC Company],
  logo: image("img/logos/indeed.svg"),
  date: [2017 - 2020],
  location: [New York, NY],
  description: list(
    [Analyze large datasets with SQL and Python, collaborate with teams to uncover business insights],
    [Create data visualizations and dashboards in Tableau, develop and maintain data pipelines with AWS],
  ),
)

#cvSection("Projects & Associations")
#cvEntry(
  title: [Volunteer Data Analyst],
  society: [ABC Nonprofit Organization],
  date: [2019 - Present],
  location: [New York, NY],
  description: list(
    [Analyze donor and fundraising data to identify trends and opportunities for growth],
    [Create data visualizations and dashboards to communicate insights to the board of directors],
    [Collaborate with other volunteers to develop and implement data-driven strategies],
  ),
)


#cvSection("Education")
#cvEntry(
  title: [ Bachelor of Science - Computer Science ],
  society: [ Facultad de Ciencias Físico Matemáticas, UANL ],
  date: [2005 - 2009],
  location: [Nuevo León, MX],
  logo: image("img/logos/fcfm.png"),
  description: (
    "Courses: Software Engineering"
      + hBar()
      + "Design Patterns"
      + hBar()
      + "Database Systems"
  ),
)

#cvSection("Certificates")
#cvHonor(
  date: [2022],
  title: [AWS Certified Security],
  issuer: [Amazon Web Services (AWS)],
)

#cvSection("Skills")
#cvSkill(type: [Languages], info: [English #hBar() Spanish])
