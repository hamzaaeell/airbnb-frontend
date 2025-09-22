#!/bin/bash

echo "🐳 Building Docker image..."
docker build -t djangobnb-frontend:test .

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    
    echo "🚀 Starting container..."
    docker run -d --name frontend-test -p 3000:3000 \
      -e NEXT_PUBLIC_API_HOST=http://localhost:8000 \
      djangobnb-frontend:test
    
    echo "⏳ Waiting for container to start..."
    sleep 10
    
    echo "📋 Container status:"
    docker ps | grep frontend-test
    
    echo "📝 Container logs:"
    docker logs frontend-test
    
    echo "🌐 Testing application..."
    if curl -f -s http://localhost:3000 > /dev/null; then
        echo "✅ Application is responding!"
        echo "🎉 Open http://localhost:3000 in your browser"
    else
        echo "❌ Application is not responding"
        echo "📝 Check logs: docker logs frontend-test"
    fi
    
    echo ""
    echo "🧹 To clean up when done:"
    echo "docker stop frontend-test && docker rm frontend-test"
    
else
    echo "❌ Build failed!"
    exit 1
fi