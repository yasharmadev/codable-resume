// =============================================================================
// Shared resume data — identity, contact, education, and photo settings.
// Profile-specific content lives in content/profiles/*.typ
// =============================================================================

// --- Header (shared across all profiles) ---
#let name = "Yash Sharma"
#let email = "yasharma9391@gmail.com"
#let phone = "+91-9910448265"
#let phone-alt = "7795455436"
#let website = "linkedin.com/in/yasharmays"
#let location = "Bangalore, India"

// --- Profile photo toggle ---
// Plain builds omit the photo. Compile with `--input photo=true` for photo variants.
// To use a different photo, replace `assets/profile_pic.jpg` (or update photo-file below).
#let show-photo = sys.inputs.at("photo", default: "false") == "true"
#let photo-file = "assets/profile_pic.jpg"

// --- Education (shared across all profiles) ---
#let education = (
  (degree: "M.Tech in Computer Science Engineering (CSE)", institution: "Sharda University, Greater Noida", dates: "2015", note: "78%"),
  (degree: "B.Tech in Information Technology (IT)", institution: "Lovely Professional University, Jalandhar", dates: "2012", note: "70%"),
)

// --- AI tools (shared daily drivers across all profiles) ---
#let skills-ai = ("Cursor", "GitHub Copilot", "Devin")
