// =============================================================================
// Resume data — profile selector and flat export for templates.
// Select profile at compile time: --input profile=tech-lead|java|engineering-manager
// Layout and styling live in templates/modern.typ and templates/original.typ.
// =============================================================================

#import "profiles/tech-lead.typ": tech-lead
#import "profiles/java.typ": java
#import "profiles/engineering-manager.typ": engineering-manager

#let profile-id = sys.inputs.at("profile", default: "tech-lead")
#let profiles = (
  tech-lead: tech-lead,
  java: java,
  engineering-manager: engineering-manager,
)
#let selected = profiles.at(profile-id)

#let name = selected.name
#let tagline = selected.tagline
#let years-note = selected.years-note
#let email = selected.email
#let phone = selected.phone
#let phone-alt = selected.phone-alt
#let website = selected.website
#let location = selected.location
#let summary = selected.summary
#let show-photo = selected.show-photo
#let photo-file = selected.photo-file
#let experience = selected.experience
#let education = selected.education
#let skills-heading = selected.skills-heading
#let skills-languages = selected.skills-languages
#let skills-databases = selected.skills-databases
#let skills-frameworks = selected.skills-frameworks
#let skills-cloud = selected.skills-cloud
#let skills-methods = selected.skills-methods
#let skills-testing = selected.skills-testing
#let skills-ai = selected.skills-ai
#let projects = selected.projects
