// Copyright 1997-2010, 2014 Omni Development, Inc. All rights reserved.
//
// This software may only be used and reproduced according to the
// terms in the file OmniSourceLicense.html, which should be
// distributed with this project and can also be found at
// <http://www.omnigroup.com/developer/sourcecode/sourcelicense/>.

#import <OmniFoundation/NSData-OFCompression.h>

#import <OmniFoundation/CFData-OFCompression.h>
#import <OmniBase/rcsid.h>

RCS_ID("$Id$")

@implementation NSData (OFCompression)

- (BOOL)mightBeCompressed;
{
    return OFDataMightBeCompressed((CFDataRef)self);
}

- (NSData *)compressedData:(NSError **)outError;
{
    CFErrorRef error = NULL;
    NSData *result = CFBridgingRelease(OFDataCreateCompressedData((OB_BRIDGE CFDataRef)self, &error));
    if (!result) {
        if (outError)
            *outError = CFBridgingRelease(error);
        else
            CFRelease(error);
    }
    return result;
}

- (NSData *)decompressedData:(NSError **)outError;
{
    CFErrorRef error = NULL;
    NSData *result = CFBridgingRelease(OFDataCreateDecompressedData(kCFAllocatorDefault, (OB_BRIDGE CFDataRef)self, &error));
    if (!result) {
        if (outError)
            *outError = CFBridgingRelease(error);
        else
            CFRelease(error);
    }
    return result;
}

#if !defined(TARGET_OS_IPHONE) || !TARGET_OS_IPHONE
- (NSData *)compressedBzip2Data:(NSError **)outError;
{
    CFErrorRef error = NULL;
    NSData *result = CFBridgingRelease(OFDataCreateCompressedBzip2Data((OB_BRIDGE CFDataRef)self, &error));
    if (!result) {
        if (outError)
            *outError = CFBridgingRelease(error);
        else
            CFRelease(error);
    }
    return result;
}

- (NSData *)decompressedBzip2Data:(NSError **)outError;
{
    CFErrorRef error = NULL;
    NSData *result = CFBridgingRelease(OFDataCreateDecompressedBzip2Data(kCFAllocatorDefault, (OB_BRIDGE CFDataRef)self, &error));
    if (!result) {
        if (outError)
            *outError = CFBridgingRelease(error);
        else
            CFRelease(error);
    }
    return result;
}
#endif

- (NSData *)compressedDataWithGzipHeader:(BOOL)includeHeader compressionLevel:(int)level error:(NSError **)outError;
{
    CFErrorRef error = NULL;
    NSData *result = CFBridgingRelease(OFDataCreateCompressedGzipData((OB_BRIDGE CFDataRef)self, includeHeader, level, &error));
    if (!result) {
        if (outError)
            *outError = CFBridgingRelease(error);
        else
            CFRelease(error);
    }
    return result;
}

- (NSData *)decompressedGzipData:(NSError **)outError;
{
    CFErrorRef error = NULL;
    NSData *result = CFBridgingRelease(OFDataCreateDecompressedGzip2Data(kCFAllocatorDefault, (OB_BRIDGE CFDataRef)self, &error));
    if (!result) {
        if (outError)
            *outError = CFBridgingRelease(error);
        else
            CFRelease(error);
    }
    return result;
}

@end
