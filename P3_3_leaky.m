% define convnet

leaky_layers = [ ...
    imageInputLayer([32 32 3])
    convolution2dLayer([3 3],16)
    batchNormalizationLayer
    leakyReluLayer
    maxPooling2dLayer(2)
    convolution2dLayer([3 3],32)
    batchNormalizationLayer
    leakyReluLayer
    maxPooling2dLayer(2)
    convolution2dLayer([3 3],16)
    batchNormalizationLayer
    leakyReluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];