#import "@preview/brilliant-cv:2.0.7": *
#let metadata = toml("./metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)
#let cvEntryStart = cvEntryStart.with(metadata: metadata)
#let cvEntryContinued = cvEntryContinued.with(metadata: metadata)
#let cvHonor = cvHonor.with(metadata: metadata)
#show: cv.with(metadata, profilePhoto: image("img/avatar.png"))

// Narrower date gutter for entries rendered inside a two-column block.
#let compactMetadata = metadata + (
  layout: metadata.layout + (date_width: "2cm"),
)
#let cvEntryCompact = cvEntry.with(metadata: compactMetadata)

// Keeps an entry from being split across the column boundary.
#let unbroken(body) = block(breakable: false, width: 100%, body)

// One entry, sized for a half-width grid cell.
#let colEntry(..args) = unbroken(cvEntryCompact(..args))

#let full_name = (
  metadata.personal.first_name + " " + metadata.personal.last_name
)
#set document(
  author: full_name,
  title: full_name + "'s Curriculum Vitae",
  description: "Staff Software Engineer with over 15 years of experience in designing and building scalable and reliable systems. Proficient in a wide range of technologies including Java, Python, and AWS. Passionate about mentorship and leveraging AI to solve complex problems. When not at the keyboard, I am a proud father of three, a board game enthusiast, and an avid self-hoster.",
  keywords: (
    "Java",
    "Spring",
    "Linux",
    "Docker",
    "Containers",
    "Rust",
    "Go",
    "AI",
    "Machine Learning",
    "LLM Inference",
    "vLLM",
    "Kubernetes",
  ),
)
#show link: underline

#cvSection("Professional Experience")
#cvEntry(
  title: [Staff Software Engineer],
  society: [Indeed],
  logo: image("img/logos/indeed.svg"),
  date: [2021 - Present],
  location: [Austin, TX #hBar() Remote],
  description: list(
    [Designed and delivered the company's first self-hosted SLM inference platform, taking it from architecture review to serving multiple production use cases: vLLM behind a drop-in OpenAI Chat Completions API, with LoRA adapters, FP8 quantization, per-use-case isolation, KEDA autoscaling, and end-to-end observability],
    [Migrated production workloads off external LLM vendors onto the platform, saving over \$7M annually, including an 87% reduction (\~\$5.8M/year) on a 60M request/day generation workload and a 93% reduction (\~\$1.34M/year) on a fine-tuned ranking model],
    [Delivered inline query embeddings on the live job-search path at \~20ms p95, a latency budget third-party embedding APIs (\~500ms p90) could not meet],
    [Productionized a fine-tuned SLM reranker at flat online latency, making a 44% NDCG\@10 gain and 63% fewer bad results shippable],
    [Spearheaded cost-saving initiatives delivering over \$3.3M in annual savings, including sunsetting a legacy email alerts product (\$1.7M/year), cutting the team's AWS account costs (\$1.4M/year), and removing unused data builders (\$180K/year)],
    [Traced a GPU cost-attribution bug misreporting spend across every GPU deployment in the company, driving the cross-team investigation and proposing the fix],
    [Led the bidding model migration onto the shared model-serving platform as single point of contact, using shadow tests for safe rollout and consolidating bidding onto a global cluster that simplified deployments and improved CPU utilization],
    [Owned and resolved an 11-month availability failure in a business-critical data pipeline, coordinating 3 engineers and an intern across 5 partner teams, migrating 3 of its indexes to AWS, and restoring the model refresh cadence to daily],
    [Stepped up as team lead, mentored and onboarded numerous engineers and an intern, co-created a new pair programming interview, and fostered a culture of knowledge sharing and growth],
    [Set the team's AI-assisted engineering practice, running demos and knowledge-sharing sessions on a spec-driven, agent-assisted workflow that other engineers adopted as their own],
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
    "LoRA",
    "KEDA",
    "GPU",
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

#pagebreak()

#cvSection("Projects")
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 16pt,
  colEntry(
  title: link("https://github.com/bubuntux/den")[den],
  society: [Multi-host NixOS Configuration],
  logo: image("img/logos/NixOS.svg"),
  date: [2025 - Present],
  location: [Remote],
  description: list(
    "Declarative config for a dev laptop, a family machine and a NAS: Home Manager, encrypted secrets, CI-checked builds",
    "Assembles every host from auto-discovered flake-parts modules using the dendritic pattern",
  ),
  tags: (
    "Nix",
    "NixOS",
    "Flakes",
    "flake-parts",
    "Home Manager",
    "sops",
  ),
),
  colEntry(
  title: [VPN Containers],
  society: [Open Source Container Images],
  logo: image("img/logos/wireguard.svg"),
  date: [2020 - 2025],
  location: [Remote],
  description: list(
    "Containers that make routing traffic through the "
      + link("https://github.com/bubuntux/nordvpn")[NordVPN]
      + ", "
      + link("https://github.com/bubuntux/nordlynx")[NordLynx]
      + " and"
      + link("https://github.com/bubuntux/protorrent")[ProtonVPN]
      + " network easy and secure",
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
),
  colEntry(
  title: [JUPR],
  society: [Universal Rating Platform],
  logo: image("img/logos/pickleball.png"),
  date: [2024],
  location: [Remote],
  description: list(
    "Implemented a Whatsapp bot that scans messages in group chats, parses matches and exports them to DUPR",
  ),
  tags: (
    "Rust",
    "Regex",
    "PostgreSQL",
    "SeaORM",
    "Whatsapp",
    "Pickleball",
    "DUPR",
  ),
),
  colEntry(
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
),
  colEntry(
  title: [Bitcoin Payment Connector],
  society: "People's Choice Award winner",
  logo: image("img/logos/bitcoin.svg"),
  date: [2015],
  location: [SF, CA],
  description: list(
    "Enabled a travel platform to accept Bitcoin payments",
    "Integrated with Coinbase and TestNet to process transactions",
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
),
  colEntry(
  title: link(
    "https://github.com/bubuntux/boardless-games-meteor",
  )[Boardless Games],
  society: "2nd place winner at Nearsoft",
  logo: image("img/logos/board-games.svg"),
  date: [2013],
  location: [Hermosillo, SO],
  description: list(
    "A multiplayer platform to play board games on phones",
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
),
)

#cvSection("Open Source Contributions")
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 16pt,
  colEntry(
  title: link("https://github.com/sgl-project/genai-bench")[genai-bench],
  society: "Benchmarking tool for LLM serving",
  logo: image("img/logos/genai-bench.png"),
  date: [2026],
  location: [Remote],
  description: list({
    link(
      "https://github.com/sgl-project/genai-bench/pull/163",
    )[Fix SSE parser to handle optional/variable whitespace after "data:"]
  }),
),
  colEntry(
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
),
  colEntry(
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
),
  colEntry(
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
),
  colEntry(
  title: link("https://github.com/Antergos/Cnchi")[Antergos/Cnchi],
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
),
  colEntry(
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
),
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
  )[Oracle Certified Professional, Java SE 6 Programmer],
  issuer: [Oracle],
)
#cvHonor(
  date: [2019],
  title: link(
    "https://www.credly.com/badges/0840fede-90d5-4af9-8dd6-4a4bd41f072a",
  )[Certified SAFe® 4 Agile Software Engineer],
  issuer: [SAFe by Scaled Agile, Inc],
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

#cvSection("Skills")
#cvSkill(
  type: [Languages],
  info: [English (Full Professional) #hBar() Spanish (Native)],
)
#cvSkill(
  type: [Personal Interests],
  info: [Boardgames #hBar() Pickleball #hBar() Self-hosting #hBar() Linux],
)
#cvSkill(
  type: [AI / Inference],
  info: [vLLM #hBar() SLM #hBar() LoRA #hBar() FP8 Quantization #hBar() KEDA #hBar() GPU Serving],
)
#cvSkill(
  type: [AI Tooling],
  info: [Claude Code #hBar() Gemini #hBar() Agentic Coding Workflows #hBar() Spec-Driven Development #hBar() MCP],
)
#cvSkill(
  type: [Tech Stacks],
  info: [Java #hBar() Spring #hBar() Python #hBar() Kubernetes #hBar() AWS #hBar() Terraform #hBar() Datadog #hBar() SQL #hBar() Bash #hBar() Kotlin #hBar() Rust #hBar() TypeScript],
)
