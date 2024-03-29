# 1 COMPUTING THE INVERSE TRANSFORM MATRIX
For several specific transforms, such as scaling, rotation, translation, reflections, and shear, using closed-form expression to compute the inverse of the corresponding transform matrix is faster than using the inv function in MATLAB. 
Also, numerically, the closed form expression yields more stable results. Here we will obtain the closed form expressionsfor the inverses of translation, rotation, reflection, and shear matrices.

### 1. In class, we saw how to compute the inverse of the scaling matrix, not by a linear algebra approach but by intuiting what it means to scale downwards (shrinking is the multiplicative inverse of enlarging). Similarly, compute the inverse of a translation matrix.
Hint: think about what it means to invert translation. We saw that inverting scaling means performing the opposite of the particular scaling transform: if you were enlarging the image to get the transformed image,
then the image itself is a shrunk version of the transformed image, and vice versa. Apply a similar intuition for translation

![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/093356db-c7c8-4dca-a346-fe8ab8fe90bc)


 
### 2. Using the same intuitions as what you used above, invert a rotation matrix. There is a fundamental relationship between a rotation matrix and its inverse. Can you identify this relationship?

![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/2463f2a7-9dc0-4799-bcca-4efa5d87b477)

The fundamental relationship between a rotation matrix and its inverse is that the inverse of a rotation matrix is equal to its transpose. 

This relationship arises from the properties of orthogonal matrices. Rotation matrices are orthogonal matrices, meaning that their columns (and rows) are orthonormal vectors (i.e., they have a length of 1 and are mutually perpendicular). For an orthogonal matrix, the transpose of is equal to its inverse. This is because the transpose of an orthogonal matrix maintains the orthogonality of its columns, and the dot product of any column with any other column (or row) remains 0, which is a defining property of orthogonal matrices. Therefore, for rotation matrices, taking the transpose effectively "undoes" the rotation operation, making it equivalent to the inverse rotation. This property simplifies the computation of inverse rotation matrices.



### 3. What should the inverse of a reflection matrix be, and why?

The inverse of a reflection matrix should be the matrix itself. This is because reflecting an object twice over the same axis (or plane) brings it back to its original position.

This property arises from the nature of reflection operations, where reflecting an object over a certain axis (or plane) and then reflecting it again over the same axis (or plane) reverses the effect of the initial reflection, resulting in the original object. For example, consider reflecting a point across the x-axis. If we perform this reflection twice, the point will return to its original position. This same principle holds true for reflection matrices in higher dimensions as well. Therefore, the inverse of a reflection matrix is the matrix itself.



### 4. The inverse for the shear matrix is slightly trickier to intuit, so we will first calculate its inverse using a standard matrix-inversion formula. You will only need the inversion formula for a 2×2 matrix:
![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/42e6c3f2-a842-4bfe-8acc-1d85bbc45a90)
### Use the above formula to calculate the inverse of the matrix for the shear transform along the x-direction. Intuitively, what does this inverse mean? Can you obtain a similar formula for the inverse of the shear transform along the y-direction?

The inverse of the shear matrix along the x-direction is another shear matrix, but with the opposite shear factor. Intuitively, this makes sense because if we shear an object along the x-direction and then apply the inverse shear transformation, it should cancel out the shear effect and bring the object back to its original position.

We can obtain a similar formula for the inverse of the shear transform along the y-direction. Now, for the shear transform along the y-direction, the shear matrix is:

![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/354bf762-aee8-4839-8198-c1b77469d659)

Using the same formula for the inverse of a 2x2 matrix, the inverse would be:

![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/dd25e985-37f4-4521-bfd8-ddd5f5b2f3fa)

This represents the transformation that undoes the applied shear effect, restoring the object to its original shape without the shearing along the y-axis.


     
# 2 IMPLEMENTING IMAGE TRANSFORM
Use the five-step method discussed in class to implement the image transforms in MATLAB. Your function(s) should have the declaration iimmediately following on the next page.

TransformedImage = transformImage(InputImage, TransformMatrix,TransformType);

Here, InputImage should be a matrix of size Hin ×Win, where Hin and Win are the height and width of the input image. Similarly, TransformedImage is a matrix of size Hout ×Wout, where Hout and Wout are the height and width of the transformed image. Notice that these are
grayscale images. Include the input and transformed images in your report. TransformMatrix is a 3 × 3 matrix that represents a particular transform. TransformType is a string, that can take the following values ‘scaling’, ‘rotation’, ‘translation’, ‘reflection’, ‘shear’, ‘affine’, ‘homography’. Your function should use TransformType to specify the inverse matrix as computed in Section 1. Inverses to Affine and homography transforms can be done using inv in MATLAB, but the other inverses must be set up using the intuitions from Section 1. Do help strcmp to look at comparing strings in MATLAB. Your function as explained earlier should at the very least take a grayscale image as input and provide a grayscale image as output. This means that if you use the example images provided with the project, you will have to convert those example images to grayscale before you run your code. You are welcome to write your code so that it uses color images as input and output, but at minimum you should use grayscale images. If you use color images, you need not provide results on grayscale images. If you use color images, note that your transformImage code will have to use a loop that loops over the three channels of the image. Provide results on all images in question (see the top of Section 1) for the following transforms:

### 1. Change the size of the image to 1080×1920 (make sure the image you start with is not already 1080×1920).
If we run the "TransformingImages_Q2_1.m" file, it will convert the image to 1080×1920. And after that, depending on the "TransformType" and "TransformMatrix" parameter values it will provide us the corresponding output images.
If we give the following parameter values and call the "TransformingImages_Q2_1.m" file, we will get the corresponding output images.
[NOTE: we definitely have to put the semi-colon ';' after each command line, otherwise it will print numeric values of that variable in the command window.]
>> TransformType = 'scaling';
>> s = 0.5;
>> TransformMatrix = [s 0 0; 0 s 0; 0 0 1];




Input and output images for "Image1.png".
[NOTE: we definitely have to put the semi-colon ';' after each command line, otherwise it will print numeric values of that variable in the command window.] 
>> InputImage = imread('Image1.png');
>> TransformingImages_Q2_1(InputImage, TransformMatrix, TransformType);
>> 
![Image1](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/fb61191e-7c5b-47ab-870e-a0c289bce7d4) ![TransformedImage](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/4b616be8-42c4-4012-a611-90e09b0b4775)

Input and output images for "Image2.png".
[NOTE: we definitely have to put the semi-colon ';' after each command line, otherwise it will print numeric values of that variable in the command window.] 
>> InputImage = imread('Image2.png');
>> TransformingImages_Q2_1(InputImage, TransformMatrix, TransformType);
>> 
![Image2](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/a8dfaeda-a62e-456b-b468-9b9fd36e554d) ![TransformedImage2](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/8385e342-083d-4206-84d1-0b7036029676)

Input and output images for "20160104021A_Left.JPG".
[NOTE: we definitely have to put the semi-colon ';' after each comman line, otherwise it will print numeric values of that variable in the command window.]
>> InputImage = imread('20160104021A_Left.JPG');
>> TransformingImages_Q2_1(InputImage, TransformMatrix, TransformType);
>> 
![20160104021A_Left](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/a175918d-3137-4540-a0c8-37445414b089) ![TransformedImage3](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/d0a02051-bd80-48db-978f-97d4a14a2ba3)



### 2. Reflect the image in the y direction.

In "TransformingImages_Q2_2.m" file I have used the "Image1.png" image to perform the required operation. Followings show the input and output image after running the matlab file.

![Image1](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/a59ccf06-50dd-442e-be8f-0a00c70eb95a) ![ReflectedImage](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/9f211be5-5848-4445-a78b-27e82594fd75)


### 3. Rotate the image clockwise by 30 degrees.

In "TransformingImages_Q2_3.m" file I have used the "Image1.png" image to perform the required operation. Followings show the input and output image after running the matlab file.

![Image1](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/8a68d3d9-d8a7-4013-ba4d-3c36d894eab6)  ![Q2_3_RotatedImage](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/916e8eba-ca55-462e-98b2-5426ee30ec49)


### 4. Shear the image in the x-direction so that the additional amount added to each x value is 0.5 times each y value.

In "TransformingImages_Q2_4.m" file I have used the "Image1.png" image to perform the required operation. Followings show the input and output image after running the matlab file.

![Image1](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/93ad2156-ec5b-4fdc-855f-c370a608691e) ![Q2_4_ShearedImage](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/c010a1f5-779c-4e89-b416-0aab39b36ca3)


### 5. Translate the image by 300 in the x-direction and 500 in the y-direction, then rotate the resulting image counterclockwise by 20 degrees, then scale the resulting image down to one-half its size. You should apply the transformImage function only once to do this.

In "TransformingImages_Q2_5.m" file I have used the "Image1.png" image to perform the required operation. Followings show the input and output image after running the matlab file.

![Image1](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/e4d64bff-4b3a-4c66-8bdd-b048719ffb31) ![Q2_5_CombinedTransformedImage](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/902a20e9-6c88-4ddf-b002-e68c021170b6)

### 6. The following two affine transforms:
![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/94ace310-9d6c-4a86-ad69-b5371a9e0ac4)

In "TransformingImages_Q2_6.m" file I have used the "Image1.png" image to perform the required operation. Followings show the input and output image after running the matlab file.

![Image1](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/46dcf8d0-c450-4d27-b7ab-ffb9a35a6f5b) ![Q2_6_CombinedAffineTransformedImage](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/f94de0a0-7b6f-46ed-91b2-91ddf372b93b)


### 7. The following two homographies:
![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/4b43a132-d9ed-4609-bec7-df8033cf5496)

In "TransformingImages_Q2_7.m" file I have used the "Image1.png" image to perform the required operation. Followings show the input and output image after running the matlab file.

![Image1](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/6cf70150-1fa8-4186-a4ce-a441ce9268a3) ![Q2_7_CombinedHomographyTransformedImage](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/4e856616-7472-40a4-8472-8e4c5273763a)




