echo "generate proto $1"

yarn add @grpc/proto-loader

npx proto-loader-gen-types --longs=String --enums=String --defaults --oneofs --grpcLib=@grpc/grpc-js --outDir=../$1/src/generated/ ./$2/*.proto