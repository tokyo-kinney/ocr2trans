<div align="center">
  <h3 align="center">ocr2trans</h3>

  <p align="center">
    capture and translate screenshots
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project combines the [tesseract ocr project](https://github.com/tesseract-ocr) and the [translate-shell](https://github.com/soimort/translate-shell) projects.
Takes a snapshot of anything on your screen and translates the text in the image.

![demo](https://github.com/tokyo-kinney/ocr2trans/blob/main/demo.gif)


If you can see it on your screen you should be able to translate it.
If you have a screenshot of text you can extract it as well.
</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

These packages need to be installed to provide the three main functions.

  ```
   translate-shell gnome-screenshot tesseract tesseract-langpack-<language code>
  ```
This is tested in Fdora 38 Workstation.

### Installation

Below are the step to install the requeried packages.
These instructions are for Fedora 38 Workstation.

1. Install the prerequisites first

```sudo dnf install translate-shell gnome-screenshot tesseract```

2. Find the languages you need.

   - These are for recognizing the source text in the image.
   - All should be available from dnf or yum.
```sudo dnf search tesseract-langpack```

4. Install the tesseract language file(s) you need.
   - Example for Japanese and Japanese vertical
```
   # sudo dnf install tesseract-langpack-jpn tesseract-langpack-jpn_vert
```
   - English is included by default.

5. Replace line [#16](https://github.com/tokyo-kinney/ocr2trans/blob/75d48d8d3b5c4ebeb8fdf010477b968086887bd9/ocr2trans.sh#L16) with the languages you choose:
tesseract --dpi 180 -l **jpn+eng** $OCR.png $OCR
   - [Language codes](https://github.com/tesseract-ocr/tessdoc/blob/main/Data-Files-in-different-versions.md)

6. Clone this repo into a directory of your choosing and make executable.
   ```
   # mkdir ~/bin/
   # cd ~/bin/
   # git clone https://github.com/tokyo-kinney/ocr2trans.git
   # chmod 755 ocr2trans/ocr2trans.sh
   ```

6. For convenience you can add an alias for the script.
   ```
   # vi ~/.bashrc
   # alias ocr2trans='~/bin/ocr2trans/ocr2trans.sh'
   # source ~/.bashrc
   ```

7. As an command alias or using its full path, you can assign a key shortcut for easy access.
- **Settings** > **Keyboard** > **View and Customize Shortcuts** > **Custom Shortcuts**
- Command: /home/**<username>**/bin/ocr2tans/ocr2trans.sh

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

Run the script and a crosshair will appear.
Select the text with a rectangle.
That image of text will be changed to plain text.
The text is translated and displayed in a pop-up window with the original text.
You can click on either to copy that to the clipboard.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

No license as the packages used are open source as well.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
