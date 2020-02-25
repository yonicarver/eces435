function subplot_bitplanes(image)

	image_8 = (double(bitget(image, 8)));	% MSB (most significant bit plane)
	image_7 = (double(bitget(image, 7)));
	image_6 = (double(bitget(image, 6)));
	image_5 = (double(bitget(image, 5)));
	image_4 = (double(bitget(image, 4)));
	image_3 = (double(bitget(image, 3)));
	image_2 = (double(bitget(image, 2)));
	image_1 = (double(bitget(image, 1)));	% LSB (least significant bit plane)

	subplot(2,4,1)
	imshow(image_8)
	title('Bit Plane 8')
	subplot(2,4,2)
	imshow(image_7)
	title('Bit Plane 7')
	subplot(2,4,3)
	imshow(image_6)
	title('Bit Plane 6')
	subplot(2,4,4)
	imshow(image_5)
	title('Bit Plane 5')
	subplot(2,4,5)
	imshow(image_4)
	title('Bit Plane 4')
	subplot(2,4,6)
	imshow(image_3)
	title('Bit Plane 3')
	subplot(2,4,7)
	imshow(image_2)
	title('Bit Plane 2')
	subplot(2,4,8)
	imshow(image_1)
	title('Bit Plane 1')


end