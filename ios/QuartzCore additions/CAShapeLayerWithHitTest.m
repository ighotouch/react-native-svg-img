#import "CAShapeLayerWithHitTest.h"

/*! Used by the main ShapeElement (and all subclasses) to do perfect "containsPoint" calculations via Apple's API calls
 
 This will only be called if it's the root of an SVG document and the hit was in the parent view on screen,
 OR if it's inside an SVGGElement that contained the hit
 */
@implementation CAShapeLayerWithHitTest

- (BOOL) containsPoint:(CGPoint)p
{
	BOOL boundsContains = CGRectContainsPoint(self.bounds, p); // must be BOUNDS because Apple pre-converts the point to local co-ords before running the test
	
	if( boundsContains )
	{
		BOOL pathContains = CGPathContainsPoint(self.path, NULL, p, false);
		
		if( pathContains )
		{
			
			return TRUE;
		}
	}
	return FALSE;
}

@end