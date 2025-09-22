/** @type {import('next').NextConfig} */
const nextConfig = {
    output: 'standalone',
    images: {
        remotePatterns: [
            {
                protocol: 'http',
                hostname: 'localhost',
                port: '8000',
                pathname: '/**'
            },
            {
                protocol: 'http',
                hostname: '64.226.81.32',
                port: '1337',
                pathname: '/**'
            },
            {
                protocol: 'http',
                hostname: 'dev-djangobnb-alb-720056700.us-east-1.elb.amazonaws.com',
                pathname: '/**'
            }
        ]
    }
};

export default nextConfig;
