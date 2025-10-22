# vlckit-spm

This repository provides a Swift Package Manager (SPM) wrapper for [VLCKit](https://code.videolan.org/videolan/VLCKit).
It simplifies building and distributing stable and unstable versions of VLCKit via SPM.

---

## 📦 Usage

### Generate Package.swift

Use the `generate.sh` script to generate a `Package.swift` file for a given VLCKit version and source URL.

```bash
bash generate.sh "4.0.0.a16" "https://download.videolan.org/pub/cocoapods/unstable/VLCKit-4.0.0a16-95efb67d-8e3d17c89.tar.xz"
```

After generation, commit and push the updated `Package.swift`:
```bash
git add Package.swift
git commit -m "Update VLCKit version"
git push
```

---

## 🚀 Create a GitHub Release

Once the package is ready, use the helper script to create a release tag and publish it to GitHub:

```bash
bash gh_release.sh "x.x.x"
```

This will:
1. Tag the repository with the provided version.
2. Push the tag to the remote.
3. Create a GitHub release.

---

## 🧩 Directory Structure

```
vlckit-spm/
├── generate.sh        # Script to generate Package.swift
├── gh_release.sh      # Script to create GitHub release
├── Package.swift      # Generated SPM package file
└── README.md          # This documentation
```

---

## 🧠 Notes

- `generate.sh` automatically configures the `binaryTarget` for VLCKit.
- Ensure `tar.xz` URLs point to valid archives (they must contain the compiled XCFramework).
- You need `git` and `gh` CLI tools installed and authenticated to create releases.

---

## 🧾 License

This repository is provided under the [LGPL License](LICENSE).
