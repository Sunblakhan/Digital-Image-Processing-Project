# Digital Image Processing (DIP) Project
A MATLAB GUI-based application for digital image processing, built using MATLAB GUIDE. 
This project was developed as part of a Bachelor's degree coursework and demonstrates various image processing techniques applied to input images.

## Features

The application provides the following image processing operations through a graphical interface:

**Image Loading**
- Load predefined images (`baby1.jpeg`, `crayon.jpeg`)

**Color & Conversion**
- Convert image to Grayscale
- Convert image to Black & White (threshold-based)
- Green to Violet color conversion (HSV hue manipulation)
- Red to Yellow color conversion
- Blue to Green color conversion
- Cyan color conversion

**Histograms**
- RGB Histogram
- Grayscale Histogram

**Noise & Filtering**
- Salt & Pepper noise
- Gaussian noise
- Weighted Average Filter (3x3 custom kernel)
- Motion Filter (50px, 45°)

**Image Enhancement**
- Quantization (4-level uniform quantization)
- Histogram Equalization

## Requirements

- MATLAB (R2018a or later recommended)
- Image Processing Toolbox

## How to Run

1. Open MATLAB and navigate to the project folder
2. Make sure the image files (`baby1.jpeg`, `crayon.jpeg`) are in the same directory
3. Run the following command in the MATLAB Command Window:
```matlab
DIPproject
```
4. The GUI window will open — use the buttons to apply different image processing operations

## Project Structure

```
├── DIPproject.m       # Main MATLAB code with all callback functions
├── DIPproject.fig     # GUIDE-generated GUI layout file
├── baby1.jpeg         # Sample input image 1
├── crayon.jpeg        # Sample input image 2
└── README.md
```

## GUI Layout

The interface contains two axes panels:
- **Axes 2** — displays the original loaded image
- **Axes 4** — displays the processed output image

## Author
- Sunbla Khan
Developed as a Bachelor's degree project in Digital Image Processing.
