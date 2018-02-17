cimport libav as lib


cdef class VideoFormat(object):

    cdef lib.AVPixelFormat pix_fmt
    cdef lib.AVPixFmtDescriptor *ptr
    cdef readonly unsigned int width, height

    cdef readonly tuple components

    cdef _init(self, lib.AVPixelFormat pix_fmt, unsigned int width, unsigned int height)

    cpdef chroma_width(self, int luma_width=?)
    cpdef chroma_height(self, int luma_height=?)


cdef class VideoFormatComponent(object):

    cdef VideoFormat format
    cdef readonly unsigned int index
    cdef lib.AVComponentDescriptor *ptr


cdef VideoFormat get_video_format(lib.AVPixelFormat c_format, unsigned int width, unsigned int height)
