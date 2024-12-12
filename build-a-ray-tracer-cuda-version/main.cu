
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <iostream>
#include <fstream>

#include "common.cuh"
#include "vec3.cuh"
#include "colour.cuh"

int main()
{
    
    // Image Size

    int image_width = 1024;
    int image_height = 1024;

    // Render
    std::ofstream output("image.ppm");
    output << "P3\n" << image_width << ' ' << image_height << "\n255\n";

    for (int j = 0; j < image_height; j++) {
        std::clog << "\rScanlines remaining: " << (image_height - j) << ' ' << std::flush;
        for (int i = 0; i < image_width; i++) {
            auto pixel_colour = colour(double(i)/(image_width-1), double(j)/(image_height-1), 0);
            write_colour(output, pixel_colour);
        }
    }
    std::clog << "\rDone.                 \n";

    return 0;
}
