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
grayscale images. Include the input and transformed images in your report. TransformMatrix is a 3 × 3 matrix that represents a particular transform. TransformType is a string, that can take the following values ‘scaling’, ‘rotation’, ‘translation’, ‘reflection’, ‘shear’, ‘affine’, ‘homography’. Your function should use TransformType to specify the inverse matrix as computed in Section 1. Inverses to Affine and homography transforms can be done using inv in MATLAB, but the other inverses must be set up using the intuitions from Section 1. Do help strcmp to look at comparing strings in MATLAB. Your function as explained earlier should at the very least take a grayscale image as input and provide a grayscale image as output. This means that if you use the example images provided with the project, you will have to convert those example images to grayscale before you run your code. You are welcome to write your code so that it uses color images as input and output, but at minimum you should use grayscale images. If you use color images, you need not provide results on grayscale images. If you use color images, note that your transformImage code will have to use a loop that loops over the three channels of the image. Provide results on all images in question (see the top of Section 1) for the following transforms:

### 1. Change the size of the image to 1080×1920 (make sure the image you start with is not already 1080×1920).
