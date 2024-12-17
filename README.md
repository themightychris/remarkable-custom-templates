# reMarkable Custom Templates

My collection of custom templates for the reMarkable tablet, including templates for daily journaling, planning, creative work, and organization.

## Templates

The collection includes various template categories:

- **Life/Organization**
    - Daily Journal
    - TODO List
    - Meeting Notes
    - Wardley Maps (Portrait & Landscape)

- **Creative**
    - Mobile Mockups

## Installation

1. Copy this repository to your reMarkable tablet
2. Run the installation script:

   ```bash
   ./install.sh
   ```

The installation script will:

- Back up your existing templates
- Patch the stock templates configuration
- Install the new template files
- Restart the reMarkable UI to apply changes

## Template Format

Templates are provided in both PNG and SVG formats. The `templates.json` file configures:

- Template names and filenames
- Icon codes for the UI
- Categories for organization
- Orientation (portrait/landscape)
- Device compatibility (reMarkable 2, reMarkable Plus)

## Backup System

The installation process automatically creates backups:

- Stock templates are preserved in `templates.json.state/stock.json`
- Previous configurations are backed up with timestamps
- Your current templates.json is backed up before any changes

## Contributing

Feel free to contribute by:

- Adding new templates
- Improving existing templates
- Fixing bugs or issues
- Enhancing the installation process

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
