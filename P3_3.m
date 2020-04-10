% define convnet

layers = [ ...
    imageInputLayer([32 32 3])
    convolution2dLayer([3 3],16)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2)
    convolution2dLayer([3 3],32)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2)
    convolution2dLayer([3 3],16)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];