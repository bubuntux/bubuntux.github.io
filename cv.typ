#import "@preview/brilliant-cv:2.0.7": *
#let metadata = toml("./metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)
#let cvEntryStart = cvEntryStart.with(metadata: metadata)
#let cvEntryContinued = cvEntryContinued.with(metadata: metadata)
#let cvHonor = cvHonor.with(metadata: metadata)
#show: cv.with(metadata, profilePhoto: image("img/avatar.png"))

#let full_name = (
  metadata.personal.first_name + " " + metadata.personal.last_name
)
#set document(author: full_name, title: full_name + "'s Curriculum Vitae")
#show link: underline

#cvSection("Professional Experience")
#cvEntry(
  title: [Staff Software Engineer],
  society: [Indeed],
  logo: image("img/logos/indeed.svg"),
  date: [2021 - Present],
  location: [Austin, TX #hBar() Remote],
  description: list(
    [
      Spearheaded multiple cost-saving initiatives, resulting in over \$1.8M in annual savings through measures such as pausing Feed Alerts (\$1.7M), optimizing data builders (\$180k), and reducing AWS account costs (\$120k/month)
    ],
    [ Led the successful migration of bidding models to the Inference Server and migrated 3 critical indexes to AWS, improving deployment simplicity, CPU utilization, and overall system stability.],
    [Drove the creation of comprehensive monitoring dashboards and SLOs for critical services, enhancing system observability and reliability.],
    [Demonstrated strong technical leadership by owning and resolving a critical 11-month long incident, ensuring the availability of the Job Alerts functionality.],
    [Pioneered research into Java 21 adoption and led the migration of an unmaintained library to a modern, supported alternative, demonstrating a commitment to technical innovation.],
    [Mentored and onboarded numerous junior engineers and interns, created and scaled a new pair programming interview, and fostered a culture of knowledge sharing and growth.],
    [Acted as a key technical partner and point of contact for numerous cross-functional teams, unblocking critical initiatives and ensuring successful project delivery.],
  ),
  tags: (
    "Java",
    "Spring",
    "AWS",
    "Kotlin",
    "Javascript",
    "React",
    "Python",
    "Docker",
    "Scala",
    "Kubernetes",
    "vLLM",
    "SLM",
  ),
)
#cvEntry(
  title: [Senior Software Engineer],
  society: [Natera],
  logo: image("img/logos/natera.svg"),
  date: [2020 - 2021],
  location: [Austin, TX #hBar() Remote],
  description: list(
    [Engineered a serverless application empowering patients and clinics to manage communication preferences],
    [Enhanced application performance by implementing query optimization, pagination, and data caching strategies],
    [Spearheaded the migration to a newer, more secure version of Spring Boot, mitigating security vulnerabilities],
  ),
  tags: (
    "Java",
    "Spring",
    "Hibernate",
    "JPA",
    "MySQL",
    "AWS",
    "Lambda",
    "DynamoDB",
    "TypeScript",
  ),
)
#cvEntry(
  title: [Lead Software Engineer],
  society: [Switchfly],
  logo: image("img/logos/switchfly.svg"),
  date: [2017 - 2020],
  location: [SF, CA - Denver, CO],
  description: list(
    "Led a team of four developers, providing technical guidance and overseeing project execution to success",
    "Expanded market reach by integrating with external hotel, car, insurance, and flight systems in multiple countries",
    "Architected and implemented a new system design to accelerate the integration of third-party APIs",
  ),
  tags: (
    "Java",
    "Spring",
    "Hibernate",
    "PostgreSQL",
    "Selenium",
    "Ember.js",
    "FTL",
  ),
)
#cvEntry(
  title: [Software Engineer],
  society: [Nearsoft],
  logo: image("img/logos/nearsoft.png"),
  date: [2011 - 2017],
  location: [ Monterrey, NL #hBar() Remote ],
  description: list(
    "Participated in multiple technology migrations including SVN to Git, Maven to Gradle, and Java 7 to Java 8",
    "Optimized the development feedback loop by parallelizing CI/CD pipelines using Jenkins",
    "Contributed to the development and enhancement of a travel platform system",
  ),
  tags: (
    "Java",
    "Spring",
    "Hibernate",
    "PostgreSQL",
    "Selenium",
    "Ember.js",
    "FTL",
  ),
)

#cvEntry(
  title: [Software Engineer],
  society: [S&C Constructores de Sistemas],
  logo: image("img/logos/sc.jpg"),
  date: [2009 - 2011],
  location: [ Monterrey, NL #hBar() Remote ],
  description: list(
    "Established a new business line by building an e-invoice system that integrated with a CMS and regulatory entities",
    "Implemented a proper branching strategy that consolidated different client implementations into one platform",
    "Contributed to the development and maintenance of a Content Management System (CMS)",
  ),
  tags: (
    "Java",
    "Spring",
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

#pagebreak()

#cvSection("Projects")
#cvEntry(
  title: [VPN Containers],
  society: [Personal Project],
  logo: image("img/logos/wireguard.svg"),
  date: [2020 - 2025],
  location: [Remote],
  description: list(
    "Containers that makes routing traffic through the NordVPN/ProtonVPN network easy and secure with an integrated iptables kill switch",
    [ 17M+ downloads #hBar() 1K+ stars #hBar() 250+ forks ],
  ),
  tags: (
    "Containerization",
    "Docker",
    "Podman",
    "Iptables",
    "Networking",
    "Bash",
    "Linux",
    "Wireguard",
    "OpenVPN",
    "s6",
  ),
)
#cvEntry(
  title: link(
    "https://github.com/bubuntux/whatsapp_to_dupr",
  )[Whatsapp to DUPR exporter],
  society: [Personal Project],
  logo: image("img/logos/pickleball.png"),
  date: [2024],
  location: [Remote],
  description: list(
    "Implemented a Whatsapp bot that scan messages in group chats, parse matches and export them to DUPR",
  ),
  tags: (
    "Rust",
    "Whatsapp",
    "Pickleball",
    "DUPR",
    "Regex",
    "Serde",
    "Json",
  ),
)
#cvEntry(
  title: [Rocks],
  society: [1st place winner at Unearthed Denver 2017],
  logo: image("img/logos/unearthed.svg"),
  date: [2017],
  location: [Denver, CO],
  description: list(
    "Designed a system to filter out low-quality minerals using machine learning and a tomato-sorting-like machine",
    "Trained a convolutional neural network to classify minerals",
  ),
  tags: (
    "Hackathon",
    "Python",
    "Android",
    "Google Cloud ML",
    "TensorFlow",
    "InceptionV3",
    "ML",
    "CNN",
  ),
)
#cvEntry(
  title: [Bitcoin Payment Connector],
  society: "People's Choice Award winner",
  logo: image("img/logos/bitcoin.svg"),
  date: [2015],
  location: [San Francisco, CA],
  description: list(
    "Enabled a travel platform to accept Bitcoin payments",
    "Integration with Coinbase and TestNet",
  ),
  tags: (
    "Hackathon",
    "Java",
    "Spring",
    "Bitcoin",
    "Blockchain",
    "Coinbase",
    "Cryptocurrency",
    "TestNet",
  ),
)
#cvEntry(
  title: link(
    "https://github.com/bubuntux/boardless-games-meteor",
  )[Boardless Games],
  society: "2nd place winner at Nearsoft",
  logo: image("img/logos/board-games.svg"),
  date: [2013],
  location: [Hermosillo, SO],
  description: list(
    "A multiplayer framework to play board games on phones",
    "Supported games: Love Letter and The Resistance",
  ),
  tags: (
    "Hackathon",
    "Boardgames",
    "CoffeeScript",
    "CSS",
    "HTML",
    "Jade",
    "JavaScript",
    "Meteor",
    "MongoDB",
    "Node.js",
    "Pug",
  ),
)



#cvSection("Open Source Contributions")
#cvEntry(
  title: link("https://github.com/NixOS")[NixOS],
  society: "Declarative Linux distribution ",
  logo: image("img/logos/NixOS.svg"),
  date: [2024],
  location: [Remote],
  description: list({
    link(
      "https://github.com/NixOS/nixpkgs/pull/354062",
    )[Update cloudflare-wrap enrollment]
    hBar()
    link(
      "https://github.com/NixOS/nixpkgs/pull/296164",
    )[Add ivsc-firmware to ipu6 option]
    hBar()
    link(
      "https://github.com/NixOS/nixpkgs/pull/295508",
    )[Add a1_prod symbolic links to fix ipu6 webcams]
  }),
)
#cvEntry(
  title: link("https://github.com/ublue-os/")[Universal Blue],
  society: "Community built operating system images",
  logo: image("img/logos/universal blue.png"),
  date: [2023],
  location: [Remote],
  description: list({
    link("https://github.com/blue-build/modules/pull/373")[Fix fonts module]
    hBar()
    link("https://github.com/ublue-os/config/pull/73")[Add arch toolbox]
    hBar()
    link("https://github.com/ublue-os/main/pull/273")[Add clipman for sericea]
    hBar()
    link(
      "https://github.com/ublue-os/main/pull/271",
    )[Remove unecessary workaround]
  }),
)
#cvEntry(
  title: link("https://github.com/datafaker-net/datafaker")[Datafaker],
  society: "Library to generate fake data",
  logo: image("img/logos/datafaker.jpg"),
  date: [2022],
  location: [Remote],
  description: list({
    link(
      "https://github.com/datafaker-net/datafaker/pull/82",
    )[Implement a lazy cache on all locales, speeding up to 50% tests using multiple languages ]
  }),
  // tags: ("Java",),
)
#cvEntry(
  title: link("https://github.com/Antergos/Cnchi")[Angergos/Cnchi],
  society: "Graphical Installer for Antergos Linux",
  logo: image("img/logos/cnchi.png"),
  date: [2015],
  location: [Remote],
  description: list({
    link(
      "https://github.com/Antergos/Cnchi/pull/456",
    )[Fix bash script that generates GRUB fallback menu entries and prioritize non-LTS kernels]
  }),
  // tags: ("Java",),
)

#cvEntry(
  title: link("https://github.com/testng-team/testng")[TestNG],
  society: "Java testing framework",
  logo: image("img/logos/testng.png"),
  date: [2011],
  location: [Remote],
  description: list({
    link(
      "https://github.com/testng-team/testng/pull/114",
    )[Fix issue \#92 - \@BeforeTest method in a super class will be called multiple time when alwayRun = true]
  }),
  // tags: ("Java",),
)

// #cvEntry(
//   title: link("https://github.com/emesene/emesene")[Emesene],
//   society: "instant messenger",
//   logo: image("img/logos/emesene.png"),
//   // date: [],
//   location: [Remote],
//   description: list({
//     link(
//       "https://github.com/emesene/emesene/pull/838",
//     )[Add feature to only show notifications when available]
//     hBar()
//     link(
//       "https://github.com/emesene/emesene/pull/821",
//     )[Hide close button tab if only has one tab]
//   }),
//   // tags: ("Python",),
// )

// #cvEntry(
//   title: [Open Source contributions],
//   society: "GitHub",
//   logo: image("img/logos/opensource.svg"),
//   date: [2011 - Present],
//   location: [Remote],
//   description: list(
//     {
//       h(1fr)
//       link("https://github.com/Antergos/Cnchi")[Angergos/Cnchi - ]
//     },
//     {
//       link("https://github.com/testng-team/testng")[TestNG - ]
//       h(1fr)
//       link("https://github.com/scribejava/scribejava")[ScripeJava - ]
//       link(
//         "https://github.com/scribejava/scribejava/pull/298",
//       )[Add support for Ubuntu One]
//       hBar()
//       link(
//         "https://github.com/scribejava/scribejava/pull/259 ",
//       )[Update Dropbox api]
//     },
//     { },
//   ),
// )


#cvSection("Certificates")
//TODO: linkedin cert?
#cvHonor(
  date: [2013],
  title: link(
    "https://www.credly.com/badges/7a58ac90-8119-485d-bd8a-83f0d3e6c69f",
  )[Oracle Certified Professional, Java EE 5 Web Component Developer],
  issuer: [Oracle],
)
#cvHonor(
  date: [2011],
  title: link(
    "https://www.credly.com/badges/35fd49cb-90a9-42bd-981f-f64ff37f2655",
  )[ Oracle Certified Professional, Java SE 6 Programmer ],
  issuer: [Oracle],
)
#cvHonor(
  date: [2019],
  title: link(
    "https://www.credly.com/badges/0840fede-90d5-4af9-8dd6-4a4bd41f072a",
  )[ Certified SAFe® 4 Agile Software Engineer ],
  issuer: [SAFe by Scaled Agile, Inc],
)

#cvSection("Skills")
#cvSkill(
  type: [Languages],
  info: [English (Full Professional) #hBar() Spanish (Native)],
)
#cvSkill(
  type: [Personal Interests],
  info: [Boardgames #hBar() Pickleball #hBar() Self-host #hBar() Linux],
)
#cvSkill(
  type: [Tech Stacks],
  info: [Java #hBar() Spring #hBar() Containerization #hBar() AWS #hBar() Bash #hBar() SQL #hBar() Python #hBar() TypeScript #hBar() JavaScript],
)
